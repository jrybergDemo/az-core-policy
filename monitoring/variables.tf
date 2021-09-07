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
  description = "The location to deploy the resources to. Valid values: usgovtexas, westus2.  Default westus2"
}

variable "subscription_id" {
  type        = string
  description = "The subscription scope"
}

variable "log_analytics_rg_name" {
  type        = string
  description = "The log analytics resource group name"
}

variable "log_analytics_name" {
  type        = string
  description = "The log analytics Workspace name"
}

variable "policy_identity_role" {
  type        = string
  description = "The role for System Assigned Identity for Contoso_Monitoring Initiative"
}

variable "sa_policy_def_list" {
  type        = map
  description = "The list of custom monitoring policies with Storage Account to be added to the policy set."
}

variable "la_policy_def_list" {
  type        = map
  description = "The list of custom monitoring policies with Log Analytics Workspaces to be added to the policy set."
}

variable "sa_policy_def_parameters" {
  type        = map
  description = "The map of parameters required for custom Storage Account monitoring policies to be added to the policy set."
}

variable "la_policy_def_parameters" {
  type        = map
  description = "The map of parameters required for custom Log Analytics Workspace monitoring policies to be added to the policy set."
}

variable "storage_account_rg_name" {
  type        = string
  description = "The storage account resource group name"
}

variable "storage_account_name" {
  type        = string
  description = "The storage account name"
}