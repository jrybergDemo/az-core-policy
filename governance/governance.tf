terraform {
  required_providers {
    azurerm = "~> 3.45.0"
  }

  backend "azurerm" { }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

data "azurerm_management_group" "mg" {
  name = var.policy_scope
}

data "azurerm_subscription" "current" {
}

resource "azurerm_policy_definition" "policy_defs" {
  for_each = {
    for policy, type in var.policy_list: policy => type
    if type.policy_type == "Custom"
  }

  name                = each.key
  description         = lookup(each.value,"description", "")
  management_group_id = data.azurerm_management_group.mg.id
  policy_type         = "Custom"
  metadata            = each.value.metadata
  mode                = each.value.mode
  display_name        = each.key
  policy_rule         = file(each.value.rule_path)
  parameters          = each.value.parameters_path == "" ? "" : file(each.value.parameters_path)
}

resource "azurerm_policy_set_definition" "policy_set" {
  depends_on            = [azurerm_policy_definition.policy_defs]
  name                  = var.policy_set_name
  management_group_id   = data.azurerm_management_group.mg.id
  policy_type           = var.policy_type
  display_name          = var.policy_set_name
  parameters            = var.policy_set_parameters

  #Add builtin and custom policies from policy_list variable
  dynamic "policy_definition_reference" {
    for_each = var.policy_list

    content {
      parameter_values     = lookup(policy_definition_reference.value, "parameters", "")
      policy_definition_id = lookup(policy_definition_reference.value, "id", "/providers/Microsoft.Management/managementgroups/${data.azurerm_management_group.mg.name}/providers/Microsoft.Authorization/policyDefinitions/${policy_definition_reference.key}")
      policy_group_names   = can(policy_definition_reference.value["policy_group_names"]) ? policy_definition_reference.value["policy_group_names"] : null # lookup() does not work with null default value, so we use can() here 2/28/2023
      reference_id         = lookup(policy_definition_reference.value, "name", policy_definition_reference.key)
    }
  }
}

resource "azurerm_management_group_policy_assignment" "policy_assignment" {
  depends_on           = [azurerm_policy_set_definition.policy_set]
  name                 = var.policy_set_name
  management_group_id  = data.azurerm_management_group.mg.id
  policy_definition_id = azurerm_policy_set_definition.policy_set.id
  description          = var.policy_description
  display_name         = var.policy_set_name
  not_scopes           = var.policy_exclude_rg_id_list
  parameters           = <<-EOT
    {
      "pipExcludeRgIds": {
        "value": ${var.pip_exclude_rg_id_list}
      },
      "blobExcludeRgIds": {
        "value": ${var.blob_exclude_rg_id_list}
      },
      "effect": {
        "value": "${var.set_audit_or_disabled}"
      },
      "subnetExcludeNames": {
        "value": ${var.subnet_exclude_list}
      },
      "subnetExcludeRgNames": {
        "value": ${var.subnet_exclude_rg_list}
      }
    }
    EOT
}
