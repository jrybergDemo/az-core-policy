terraform {
  required_providers {
    azurerm = "~> 2.75.0"
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
  for_each = var.policy_def_list

  name                  = each.key
  management_group_name = data.azurerm_management_group.mg.name
  policy_type           = "Custom"
  mode                  = each.value.mode
  display_name          = each.key
  policy_rule           = file(each.value.rule_path)
  parameters            = each.value.parameters_path == "" ? "" : file(each.value.parameters_path)
}

resource "azurerm_policy_set_definition" "policy_set" {
  depends_on            = [azurerm_policy_definition.policy_defs]
  name                  = var.policy_set_name
  management_group_name = data.azurerm_management_group.mg.name
  policy_type           = var.policy_type
  display_name          = var.policy_set_name
  parameters            = var.policy_set_parameters

  policy_definition_group {
    name = "custom"
  }

  #Add builtin policy from policy_list variable
  dynamic "policy_definition_reference" {
    for_each = var.policy_list

    content {
      policy_definition_id = policy_definition_reference.value["id"]
      parameter_values     = lookup(policy_definition_reference.value, "parameters", "")
      reference_id         = policy_definition_reference.value["name"]
    }
  }

  #Add custom policies (policy defs)
  dynamic "policy_definition_reference" {
    for_each = azurerm_policy_definition.policy_defs

    content {
      policy_definition_id = policy_definition_reference.value["id"]
      parameters           = var.policy_def_list["${policy_definition_reference.value["name"]}"].parameter_values
      reference_id         = policy_definition_reference.value["name"]
      policy_group_names   = ["custom"]
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
  parameters           = <<-EOT
    {
      "pipExcludeRgNames": {
        "value": ${var.pip_exclude_rg_list}
      },
      "effect": {
        "value": "${var.set_audit_or_disabled}"
      }
    }
    EOT
}

resource "azurerm_policy_remediation" "policy_remediation" {
  for_each = {
    for policy_def in azurerm_policy_set_definition.policy_set.policy_definition_reference : "${policy_def.reference_id}" => {
      reference_id = lower(policy_def.reference_id)
    }
  }

  name                           = each.value.reference_id
  scope                          = data.azurerm_management_group.mg.id
  policy_assignment_id           = azurerm_management_group_policy_assignment.policy_assignment.id
  policy_definition_reference_id = each.value.reference_id
}