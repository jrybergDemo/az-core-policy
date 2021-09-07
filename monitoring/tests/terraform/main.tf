terraform {
  required_providers {
    azurerm = "~> 2.59.0"
  }

  backend "azurerm" { }
}

locals {
  test_resource_name = "Contosotest"
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

data "azurerm_client_config" "current" {
}

resource "azurerm_resource_group" "rgroup" {
  name     = "Contoso_TESTING"
  location = var.location
}

resource "azurerm_key_vault" "keyvault" {
  name                            = local.test_resource_name
  resource_group_name             = azurerm_resource_group.rgroup.name
  location                        = azurerm_resource_group.rgroup.location
  sku_name                        = "standard"
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  enable_rbac_authorization       = true
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  tenant_id                       = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_storage_account" "sa" {
  name                     = local.test_resource_name
  resource_group_name      = azurerm_resource_group.rgroup.name
  location                 = azurerm_resource_group.rgroup.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "filesystem" {
  name               = "Contosofilesystem"
  storage_account_id = azurerm_storage_account.sa.id
}

resource "azurerm_automation_account" "AutomationAccount" {
  name                = local.test_resource_name
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name
  sku_name            = "Basic"
}

resource "azurerm_recovery_services_vault" "recoveryvault" {
  name                = local.test_resource_name
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name
  sku                 = "Standard"
  soft_delete_enabled = false
}

resource "azurerm_public_ip" "bastion_public_ip" {
  name                = "${local.test_resource_name}-bastion"
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = local.test_resource_name
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name

  ip_configuration {
    name                 = "testipconfig"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion_public_ip.id
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.test_resource_name
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name
  address_space       = ["192.0.0.0/24"]
  dns_servers         = ["192.0.0.25", "192.0.0.26"]
}

resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rgroup.name
  address_prefixes     = ["192.0.0.0/27"]
}

resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rgroup.name
  address_prefixes     = ["192.0.0.48/28"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rgroup.name
  address_prefixes     = ["192.0.0.32/28"]
}


resource "azurerm_network_interface" "win_nic" {
  name                = "${local.test_resource_name}win"
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_network_interface" "win_os_nic" {
  name                = "${local.test_resource_name}winos"
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_network_interface" "linux_nic" {
  name                = "${local.test_resource_name}linux"
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_network_interface" "linux_os_nic" {
  name                = "${local.test_resource_name}linuxos"
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_sql_server" "sql_server" {
  name                         = "${local.test_resource_name}sql"
  resource_group_name          = azurerm_resource_group.rgroup.name
  location                     = azurerm_resource_group.rgroup.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

### Windows VM
resource "azurerm_windows_virtual_machine" "win_vm" {
  name                  = "${local.test_resource_name}win"
  location              = azurerm_resource_group.rgroup.location
  resource_group_name   = azurerm_resource_group.rgroup.name
  network_interface_ids = [azurerm_network_interface.win_nic.id]
  size                  = "Standard_D2s_v3"
  license_type          = "Windows_Server"
  admin_username        = "testadmin"
  admin_password        = "testP@ssW0rd!1"
  provision_vm_agent    = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "${local.test_resource_name}linux"
  resource_group_name = azurerm_resource_group.rgroup.name
  location            = azurerm_resource_group.rgroup.location
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.linux_nic.id]
  admin_username        = "testadmin"
  admin_password        = "testP@ssW0rd!1"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_sql_elasticpool" "elastic_pool" {
  name                = local.test_resource_name
  resource_group_name = azurerm_resource_group.rgroup.name
  location            = azurerm_resource_group.rgroup.location
  server_name         = azurerm_sql_server.sql_server.name
  edition             = "Basic"
  dtu                 = 50
  db_dtu_min          = 0
  db_dtu_max          = 5
  pool_size           = 5000
}

resource "azurerm_synapse_workspace" "synapseworkspace" {
  name                                 = "${local.test_resource_name}space"
  resource_group_name                  = azurerm_resource_group.rgroup.name
  location                             = azurerm_resource_group.rgroup.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.filesystem.id
  sql_administrator_login              = "testadmin"
  sql_administrator_login_password     = "testP@ssW0rd!1"
  sql_identity_control_enabled         = true
}

resource "azurerm_public_ip" "vnet_gateway_ip" {
  name                = "${local.test_resource_name}gw"
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name
  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "vnet_gw" {
  name                = local.test_resource_name
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vnet_gateway_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway.id
  }
}

resource "azurerm_mysql_server" "mysql" {
  name                = local.test_resource_name
  location            = azurerm_resource_group.rgroup.location
  resource_group_name = azurerm_resource_group.rgroup.name

  administrator_login          = "testadmin"
  administrator_login_password = "testP@ssW0rd!1"

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
