variable "policy_set_name" {
  type        = string
  description = "The name of the policy set and assignment."
}

variable "policy_scope" {
  type        = string
  description = "The scope for the policy set."
}

variable "policy_list" {
  type        = map
  description = "The list of policies to be added to the policy set."
}

variable "policy_type" {
  type        = string
  description = "The type of the policy deployment."
}

variable "policy_description" {
  type        = string
  description = "The description to provide for the policy assignment."
}

variable "policy_identity_name" {
  type        = string
  description = "The user assigned identity to be assigned to the policy assignmet."
}

variable "policy_identity_rg" {
  type        = string
  description = "The resource group where the user assigned identity will be stored."
}

variable "policy_exclude_rg_ids_list" {
  type        = set(string)
  description = "The Resources Groups that will be excluded for policy assignment with Terraform."
}

variable "custom_windows_image_ids_list" {
  type        = string
  description = "The custom windows image resource ids for the Log Analytics & Dependency policies to be applied."
}

variable "custom_linux_image_ids_list" {
  type        = string
  description = "The custom linux image resource ids for the Log Analytics & Dependency policies to be applied."
}

variable "policy_set_parameters" {
  type        = string
  description = "The parameters required to create the policy set."
}

variable "policy_mode" {
  type        = string
  description = "The mode of the policy deployment."
}

variable "location" {
  type        = string
  description = "The location to deploy the resources to. Valid values: usgovtexas, usgovvirginia."
}

variable "diagnostics_setting_name" {
  type        = string
  description = "The name of the diagnostic setting to apply to each resource."
}

variable "log_analytics_rg_name" {
  type        = string
  description = "The log analytics resource group name"
}

variable "log_analytics_name" {
  type        = string
  description = "The log analytics Workspace name"
}

variable "storage_account_rg_name" {
  type        = string
  description = "The storage account resource group name"
}

variable "storage_account_name" {
  type        = string
  description = "The storage account name"
}

variable "storage_account_tx_rg_name" {
  type        = string
  description = "The storage account resource group name in TX region"
}

variable "storage_account_tx_name" {
  type        = string
  description = "The storage account name in TX region"
}

variable "flow_logs_retention_policy_days" {
  type        = number
  description = "The flow log retention storage in days. Use 0 for 'forever'."
}

variable "flow_logs_traffic_analytics_interval_min" {
  type        = number
  description = "The flow log workspace analytics interval in minutes. Valid values are 10 and 60."
}

variable "managed_identity_roles" {
  type = set(string)
  description = "Roles required to create and configure a user managed identity."
}

variable "dcr_info" {
  description = "Data Collection Rule (DCR) Info."
  type        = map(string)
}

###################
## Azure Monitor ##
###################
variable "data_collection_rules" {
  description = "Map of Azure monitor data collection rules."
  type        = map(object({
    os_type      = string
    data_sources = string
    log_type     = string
    data_flows   = list(object({
      destinations    = list(string)
      destinations_rg = list(string)
      streams         = list(string)
    }))
  }))
}

variable "admin_subscription_id" {
  description = "Subscription ID where Sentinel Log Analytic Workspace exist for DCR"
  type        = string
}