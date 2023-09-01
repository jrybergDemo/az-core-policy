variable "test_rg_name" {
  type        = string
  description = "The testing Resource Group"
}

variable "location" {
  type        = string
  description = "The testing location in VA"
}

variable "app_insight_list" {
  type        = map
  description = "List of mysql server lists to deploy."
}

variable "key_vault_list" {
  type        = any
  description = "The data definition of the key vault resource"
}

variable "network_security_group_list" {
  type        = any
  description = "The data definition of the network security group resource"
}

variable "storage_account_list" {
  type        = map
  description = "List of Storage Account maps with required attributes: name, replication_type (Standard | Premium), and tier (GRS | LRS | etc)"
}

variable "storage_datalake_filesystem_list" {
  type        = map
  description = "List of Data Lake file system lists to deploy."
}

variable "automation_account" {
  type        = map
  description = "Definition of the Azure Automation Account to deploy"
}

variable "recovery_services_vault_list" {
  type        = map
  description = "List of Recovery Services Vaults to deploy."
}

variable "bastion_public_ip_list" {
  type        = map
  description = "List of Bastion IP address to deploy."
}

variable "bastion_host_list" {
  type        = map
  description = "List of Bastion host lists to deploy."
}

variable "cosmos_db_list" {
  type        = map
  description = "List of cosmos db acoounts to deploy."
}

variable "vnet_list" {
  type        = map
  description = "List of vnet lists to deploy."
}

variable "sql_server_list" {
  type        = map
  description = "List of sql server lists to deploy."
}

variable "synapse_list" {
  type        = map
  description = "List of synapse lists to deploy."
}

variable "machine_learning_list" {
  type        = map
  description = "List of mysql server lists to deploy."
}

variable "mysql_server_list" {
  type        = map
  description = "List of mysql server lists to deploy."
}

variable "mssql_server_list" {
  type        = map
  description = "List of MSSQL Server & Database lists to deploy."
}

variable "vnet_gwy_list" {
  type        = map
  description = "List of vnet gwy lists to deploy."
}

variable "vnet_gwy_ip_list" {
  type        = map
  description = "List of vnet gwy IP lists to deploy."
}

variable "subnet_list" {
  type        = map
  description = "List of subnet lists to deploy."
}

variable "win_nic_list" {
  type        = map
  description = "List of win nic lists to deploy."
}

variable "win_vm_list" {
  type        = map
  description = "List of windows vm lists to deploy."
}

variable "linux_nic_list" {
  type        = map
  description = "List of linux nic lists to deploy."
}

variable "linux_vm_list" {
  type        = map
  description = "List of linux vm lists to deploy."
}

variable "image_list" {
  type        = map(string)
  description = "Map of image names and os types to build VMs to test against"
}

variable "admin_username" {
  description = "Admin name"
}

variable "admin_password" {
  description = "Admin password"
}

variable "custom_image_windows_vm_list" {
  type        = map
  description = "List of windows vm lists from custom image to deploy."
}

variable "custom_image_ubuntu_vm_list" {
  type        = map
  description = "List of Ubuntu vm lists custom image to deploy."
}

variable "custom_image_rhel_vm_list" {
  type        = map
  description = "List of RHEL vm lists custom image to deploy."
}

variable "win_linux_vms_shutdown" {
  type        = map
  description = "List of Windows & Linux vm lists lists to shut down."
}

variable "shutdown_time" {
  description = "The time when the VM will be turned off"
  type        = string
}

variable "shutdown_timezone" {
  description = "Timezone for VM shutdown schedule"
  type        = string
}

variable "ase_list" {
  type        = map
  description = "List of App Service Environments to deploy."
}

variable "app_gateway_list" {
  type        = map
  description = "List of App Service Environments to deploy."
}

variable "app_service_plan_list" {
  type        = map
  description = "List of App Service Plans to deploy."
}

variable "app_service_list" {
  type        = map
  description = "List of App Service to deploy."
}

variable "function_app_list" {
  type        = map
  description = "List of Function Apps to deploy."
}

variable "logic_apps" {
  type        = map
  description = "Definition of the Logic Apps to deploy"
}