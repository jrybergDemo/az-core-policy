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

variable "policy_exclude_rg_id_list" {
  type        = set(string)
  description = "The Resources Groups that will be excluded for policy assignment with Terraform."
}

variable "policy_set_parameters" {
  type        = string
  description = "The parameters required to create the policy set."
}

variable "policy_mode" {
  type        = string
  description = "The mode of the policy deployment."
}

variable "set_audit_or_disabled" {
  type =  string
  description = "Set policy effect between disabled and audit"
}

variable "pip_exclude_rg_id_list" {
  type =  string
  description = "Resource group names to be allowed to have Public IP address (PIP)"
}

variable "blob_exclude_rg_id_list" {
  type =  string
  description = "Resource group names to be allowed to have Public Storage Account"
}

variable "subnet_exclude_list" {
    type = string
    description = "Subnet names to be excluded from audit policy to look for subnets without route tables"
}

variable "subnet_exclude_rg_list" {
    type = string
    description = "Resource Groups names to be excluded from audit policy to look for subnets without route tables"
}