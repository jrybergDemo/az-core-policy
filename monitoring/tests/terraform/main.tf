terraform {
  required_providers {
    azurerm = "~> 3.66.0"
  }

  backend "azurerm" {}
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

data "azurerm_client_config" "current" {
}

resource "azurerm_resource_group" "rgroup" {
  name     = var.test_rg_name
  location = var.location
}

resource "azurerm_network_security_group" "nsg" {
  for_each = var.network_security_group_list

  name                = each.key
  location            = each.value
  resource_group_name = azurerm_resource_group.rgroup.name
}

resource "azurerm_key_vault" "keyvault" {
  for_each = var.key_vault_list

  name                            = each.key
  resource_group_name             = azurerm_resource_group.rgroup.name
  location                        = each.value
  sku_name                        = "standard"
  enabled_for_deployment          = "true"
  enabled_for_disk_encryption     = "true"
  enabled_for_template_deployment = "true"
  enable_rbac_authorization       = "true"
  purge_protection_enabled        = "true"
  soft_delete_retention_days      = 7
  tenant_id                       = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_storage_account" "sa" {
  for_each   = var.storage_account_list
  depends_on = [azurerm_resource_group.rgroup]

  name                            = each.key
  resource_group_name             = azurerm_resource_group.rgroup.name
  location                        = each.value
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  allow_nested_items_to_be_public = "false"
  min_tls_version                 = "TLS1_2"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "filesystem" {
  for_each = var.storage_datalake_filesystem_list

  name               = each.key
  storage_account_id = azurerm_storage_account.sa[each.value.storage_account].id
}

resource "azurerm_synapse_workspace" "synapseworkspace" {
  for_each = var.synapse_list

  name                                 = each.key
  resource_group_name                  = azurerm_resource_group.rgroup.name
  location                             = each.value.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.filesystem[each.value.dl_filesystem].id
  sql_administrator_login              = var.admin_username
  sql_administrator_login_password     = var.admin_password
  sql_identity_control_enabled         = true

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_mssql_server" "sql_server" {
  for_each = var.sql_server_list

  name                         = each.key
  resource_group_name          = azurerm_resource_group.rgroup.name
  location                     = each.value
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_elasticpool" "elastic_pool" {
  for_each = var.sql_server_list

  name                = each.key
  resource_group_name = azurerm_resource_group.rgroup.name
  location            = each.value
  server_name         = azurerm_mssql_server.sql_server[each.key].name
  max_size_gb         = 4.8828125
  per_database_settings {
    min_capacity = 0
    max_capacity = 5
  }
  sku {
    name     = "BasicPool"
    tier     = "Basic"
    capacity = 50
  }
}

resource "azurerm_mysql_server" "mysql" {
  for_each = var.mysql_server_list

  name                = each.key
  location            = each.value
  resource_group_name = azurerm_resource_group.rgroup.name

  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mssql_server" "mssql_server" {
  for_each = var.mssql_server_list

  name                         = each.key
  resource_group_name          = azurerm_resource_group.rgroup.name
  location                     = each.value
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
}

resource "azurerm_mssql_database" "mssql_db" {
  for_each = var.mssql_server_list

  name                        = each.key
  server_id                   = azurerm_mssql_server.mssql_server[each.key].id
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  license_type                = "LicenseIncluded"
  max_size_gb                 = 10
  sku_name                    = "S0"
  zone_redundant              = false
  min_capacity                = 2
  read_scale                  = false
  auto_pause_delay_in_minutes = 30
}

resource "azurerm_automation_account" "AutomationAccount" {
  for_each = var.automation_account

  name                = each.key
  location            = each.value
  resource_group_name = azurerm_resource_group.rgroup.name
  sku_name            = "Basic"
}

resource "azurerm_recovery_services_vault" "recoveryvault" {
  for_each = var.recovery_services_vault_list

  name                = each.key
  location            = each.value
  resource_group_name = azurerm_resource_group.rgroup.name
  sku                 = "Standard"
  soft_delete_enabled = false

  monitoring {
    alerts_for_critical_operation_failures_enabled = false
  }
}

resource "azurerm_public_ip" "bastion_public_ip" {
  for_each = var.bastion_public_ip_list

  name                = each.key
  location            = each.value
  resource_group_name = azurerm_resource_group.rgroup.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet_list

  name                = each.key
  location            = each.value
  resource_group_name = azurerm_resource_group.rgroup.name
  address_space       = ["192.0.0.0/24", "192.0.1.0/24"]
}

resource "azurerm_subnet" "bastion" {
  for_each = var.vnet_list

  name                 = "AzureBastionSubnet"
  virtual_network_name = azurerm_virtual_network.vnet[each.key].name
  resource_group_name  = azurerm_resource_group.rgroup.name
  address_prefixes     = ["192.0.0.0/27"]
}

resource "azurerm_bastion_host" "bastion_host" {
  for_each = var.bastion_host_list

  name                = each.key
  location            = each.value.location
  resource_group_name = azurerm_resource_group.rgroup.name

  ip_configuration {
    name                 = "testipconfig"
    subnet_id            = azurerm_subnet.bastion[each.value.bastion_vnet].id
    public_ip_address_id = azurerm_public_ip.bastion_public_ip[each.value.public_ip].id
  }
}

resource "azurerm_subnet" "gateway" {
  for_each = var.vnet_list

  name                 = "GatewaySubnet"
  virtual_network_name = azurerm_virtual_network.vnet[each.key].name
  resource_group_name  = azurerm_resource_group.rgroup.name
  address_prefixes     = ["192.0.0.48/28"]
}

resource "azurerm_public_ip" "vnet_gateway_ip" {
  for_each = var.vnet_gwy_ip_list

  name                = each.key
  location            = each.value
  resource_group_name = azurerm_resource_group.rgroup.name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "vnet_gw" {
  for_each = var.vnet_gwy_list

  name                = each.key
  location            = each.value.location
  resource_group_name = azurerm_resource_group.rgroup.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vnet_gateway_ip[each.value.vnet_gwy_ip].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway[each.value.gateway_vnet].id
  }
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnet_list

  name                 = each.key
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_name].name
  resource_group_name  = azurerm_resource_group.rgroup.name
  address_prefixes     = [each.value.address_prefix]
}

resource "azurerm_network_interface" "win_nic" {
  for_each = var.win_nic_list

  name                = each.key
  location            = each.value.location
  resource_group_name = azurerm_resource_group.rgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet[each.value.subnet_name].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_application_insights" "app_insight" {
  for_each = var.app_insight_list

  name                = each.key
  location            = each.value
  resource_group_name = azurerm_resource_group.rgroup.name
  application_type    = "web"
}

resource "azurerm_machine_learning_workspace" "machine_learning" {
  for_each = var.machine_learning_list

  name                    = each.key
  location                = each.value.location
  resource_group_name     = azurerm_resource_group.rgroup.name
  application_insights_id = azurerm_application_insights.app_insight[each.value.app_insight].id
  key_vault_id            = azurerm_key_vault.keyvault[each.value.key_vault].id
  storage_account_id      = azurerm_storage_account.sa[each.value.storage_account].id

  identity {
    type = "SystemAssigned"
  }
}

## Marketplace Windows VM ##
resource "azurerm_windows_virtual_machine" "win_vm" {
  for_each = var.win_vm_list

  name                  = each.key
  location              = each.value.location
  resource_group_name   = azurerm_resource_group.rgroup.name
  network_interface_ids = [azurerm_network_interface.win_nic[each.value.win_nic].id]
  size                  = "Standard_D2s_v3"
  license_type          = "Windows_Server"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  provision_vm_agent    = true

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "linux_nic" {
  for_each = var.linux_nic_list

  name                = each.key
  location            = each.value.location
  resource_group_name = azurerm_resource_group.rgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet[each.value.subnet_name].id
    private_ip_address_allocation = "Dynamic"
  }
}

## Marketplace Linux VM ##
resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each = var.linux_vm_list

  name                            = each.key
  computer_name                   = each.key
  location                        = each.value.location
  resource_group_name             = azurerm_resource_group.rgroup.name
  size                            = "Standard_D8s_v3"
  network_interface_ids           = [azurerm_network_interface.linux_nic[each.value.linux_nic].id]
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

## Custom Image Linux Ubuntu VM ##
resource "azurerm_linux_virtual_machine" "custom_ubuntu_vm" {
  for_each = var.custom_image_ubuntu_vm_list

  name                            = each.key
  computer_name                   = each.key
  location                        = each.value.location
  resource_group_name             = azurerm_resource_group.rgroup.name
  network_interface_ids           = [azurerm_network_interface.linux_nic[each.value.nic].id]
  size                            = "Standard_D2s_v3"
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  provision_vm_agent              = true
  source_image_id                 = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${each.value.image_gallery_rg}/providers/Microsoft.Compute/images/${var.image_list.ubuntu_base_image}"

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "osdisk-${each.key}"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = 80
  }
}

## Custom Image Linux RHEL VM ##
resource "azurerm_linux_virtual_machine" "custom_rhel_vm" {
  for_each = var.custom_image_rhel_vm_list

  name                            = each.key
  computer_name                   = each.key
  location                        = each.value.location
  resource_group_name             = azurerm_resource_group.rgroup.name
  network_interface_ids           = [azurerm_network_interface.linux_nic[each.value.nic].id]
  size                            = "Standard_D2s_v3"
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  provision_vm_agent              = true
  source_image_id                 = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${each.value.image_gallery_rg}/providers/Microsoft.Compute/images/${var.image_list.rhel_base_image}"

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "osdisk-${each.key}"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = 80
  }
}

## Custom Image Windows VM ##
resource "azurerm_windows_virtual_machine" "custom_win_vm" {
  for_each = var.custom_image_windows_vm_list

  name                  = each.key
  computer_name         = each.key
  location              = each.value.location
  resource_group_name   = azurerm_resource_group.rgroup.name
  network_interface_ids = [azurerm_network_interface.win_nic[each.value.nic].id]
  size                  = "Standard_D2s_v3"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  provision_vm_agent    = true
  source_image_id       = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${each.value.image_gallery_rg}/providers/Microsoft.Compute/images/${var.image_list.win_base_image}"

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "osdisk-${each.key}"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = 250
  }
}

## Windows/Linux Marketplace & Custom VM - Shut Down ##
resource "azurerm_dev_test_global_vm_shutdown_schedule" "win_linux_vms_auto_shutdown" {
  for_each   = var.win_linux_vms_shutdown
  depends_on = [azurerm_windows_virtual_machine.win_vm, azurerm_windows_virtual_machine.custom_win_vm, azurerm_linux_virtual_machine.linux_vm, azurerm_linux_virtual_machine.custom_ubuntu_vm, azurerm_linux_virtual_machine.custom_rhel_vm]

  virtual_machine_id    = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.test_rg_name}/providers/Microsoft.Compute/virtualMachines/${each.key}"
  location              = each.value
  enabled               = true
  daily_recurrence_time = var.shutdown_time
  timezone              = var.shutdown_timezone

  notification_settings {
    enabled = false
  }
}

#Cosmos DB
resource "azurerm_cosmosdb_account" "cosmos_db" {
  for_each                  = var.cosmos_db_list
  name                      = each.key
  location                  = each.value.location
  resource_group_name       = azurerm_resource_group.rgroup.name
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  enable_automatic_failover = true

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = each.value.failover_location
    failover_priority = 1
  }

  geo_location {
    location          = each.value.location
    failover_priority = 0
  }
}

#App Service Environment
resource "azurerm_app_service_environment" "ase" {
  for_each               = var.ase_list
  name                   = each.key
  resource_group_name    = azurerm_resource_group.rgroup.name
  subnet_id              = azurerm_subnet.subnet[each.value.subnet_name].id
  pricing_tier           = "I1"
  front_end_scale_factor = 5
}

#Application Gateway
resource "azurerm_application_gateway" "applicationgateway" {
  for_each = var.app_gateway_list

  name                = each.key
  resource_group_name = azurerm_resource_group.rgroup.name
  location            = each.value.location

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "eitaastest-gwy-ip-configuration"
    subnet_id = azurerm_subnet.subnet[each.value.subnet_name].id
  }

  frontend_port {
    name = "eitaastest-appgwy-frontend-port-80"
    port = 80
  }

  frontend_ip_configuration {
    name      = "eitaastest-appgwy-frontend-private"
    subnet_id = azurerm_subnet.subnet[each.value.subnet_name].id
  }

  backend_address_pool {
    name = "eitaastest-appgwy-backend-pool"
  }

  backend_http_settings {
    name                  = "eitaastest-appgwy-http-setting-80"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "eitaastest-appgwy-listener-private-80"
    frontend_ip_configuration_name = "eitaastest-appgwy-frontend-private"
    frontend_port_name             = "eitaastest-appgwy-frontend-port-80"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "eitaastest-appgwy-routing-rule-80"
    rule_type                  = "Basic"
    http_listener_name         = "eitaastest-appgwy-listener-private-80"
    backend_address_pool_name  = "eitaastest-appgwy-backend-pool"
    backend_http_settings_name = "eitaastest-appgwy-http-setting-80"
  }

}

#App Service Plan
resource "azurerm_service_plan" "asp" {
  for_each = var.app_service_plan_list

  name                = each.key
  resource_group_name = azurerm_resource_group.rgroup.name
  location            = each.value.location
  sku_name            = "B1"
  os_type             = "Linux"
}

#App Service
resource "azurerm_linux_web_app" "app_service" {
  for_each = var.app_service_list

  name                = each.key
  resource_group_name = azurerm_resource_group.rgroup.name
  location            = each.value.location
  service_plan_id     = azurerm_service_plan.asp[each.value.asp_name].id
  enabled             = false
  site_config {}
}

#Funcion App
resource "azurerm_linux_function_app" "func_app" {
  for_each   = var.function_app_list
  depends_on = [azurerm_storage_account.sa, azurerm_service_plan.asp]

  name                       = each.key
  location                   = each.value.location
  resource_group_name        = azurerm_resource_group.rgroup.name
  service_plan_id            = azurerm_service_plan.asp[each.value.asp_name].id
  storage_account_name       = azurerm_storage_account.sa[each.value.storage_account_name].name
  storage_account_access_key = azurerm_storage_account.sa[each.value.storage_account_name].primary_access_key
  enabled                    = false
  site_config {}
}

resource "azurerm_logic_app_workflow" "logic_apps" {
  for_each = var.logic_apps

  name                = each.key
  location            = each.value
  resource_group_name = azurerm_resource_group.rgroup.name
}
