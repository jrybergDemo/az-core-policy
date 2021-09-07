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

variable "policy_def_list" {
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

variable "set_audit_or_disabled" {
  type =  string
  description = "Set policy effect between disabled and audit"
}

variable "pip_exclude_rg_list" {
  type =  string
  description = "Resource group names to be allowed to have Public IP address (PIP)"
}
