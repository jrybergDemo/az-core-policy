terraform {
  required_providers {
    azurerm = "~> 2.54.0"
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

resource "azurerm_policy_definition" "policy_defs_sa" {
  for_each = var.sa_policy_def_list

  name                  = each.key
  management_group_name = data.azurerm_management_group.mg.name
  policy_type           = "Custom"
  mode                  = each.value.mode
  display_name          = each.key
  policy_rule           = file(each.value.rule_path)
  parameters            = file(each.value.parameters_path)
}

resource "azurerm_policy_definition" "policy_defs_la" {
  for_each = var.la_policy_def_list

  name                  = each.key
  management_group_name = data.azurerm_management_group.mg.name
  policy_type           = "Custom"
  mode                  = each.value.mode
  display_name          = each.key
  policy_rule           = file(each.value.rule_path)
  parameters            = file(each.value.parameters_path)
}

resource "azurerm_policy_set_definition" "policy_set" {
  depends_on            = [azurerm_policy_definition.policy_defs_sa, azurerm_policy_definition.policy_defs_la]
  name                  = var.policy_set_name
  management_group_name = data.azurerm_management_group.mg.name
  policy_type           = var.policy_type
  display_name          = var.policy_set_name
  parameters            = var.policy_set_parameters

  #Add builtin policy from policy_list variable
  dynamic "policy_definition_reference" {
    for_each = var.policy_list

    content {
      policy_definition_id = policy_definition_reference.value["id"]
      parameter_values     = lookup(policy_definition_reference.value, "parameters", "")
      reference_id         = policy_definition_reference.value["name"]
    }
  }

  #Add custom policy for Storage Account (policy defs)
  dynamic "policy_definition_reference" {
    for_each = azurerm_policy_definition.policy_defs_sa

    content {
      policy_definition_id = policy_definition_reference.value["id"]
      parameters           = var.sa_policy_def_parameters
      reference_id         = policy_definition_reference.value["name"]
    }
  }

  #Add custom policy for Log Analytics (policy defs)
  dynamic "policy_definition_reference" {
    for_each = azurerm_policy_definition.policy_defs_la

    content {
      policy_definition_id = policy_definition_reference.value["id"]
      parameters           = var.la_policy_def_parameters
      reference_id         = policy_definition_reference.value["name"]
    }
  }
}

resource "azurerm_policy_assignment" "policy_assignment" {
  depends_on           = [azurerm_policy_set_definition.policy_set]
  name                 = var.policy_set_name
  scope                = data.azurerm_management_group.mg.id
  policy_definition_id = azurerm_policy_set_definition.policy_set.id
  description          = var.policy_description
  display_name         = var.policy_set_name
  parameters           = <<-EOT
    {
      "logAnalytics": {
        "value": "/subscriptions/${var.subscription_id}/resourceGroups/${var.log_analytics_rg_name}/providers/Microsoft.OperationalInsights/workspaces/${var.log_analytics_name}"
      },
      "storageAccount": {
        "value": "/subscriptions/${var.subscription_id}/resourceGroups/${var.storage_account_rg_name}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_name}"
      }
    }
    EOT
  identity {
    type = "SystemAssigned"
  }
  location = var.location
}

resource "azurerm_role_assignment" "policy_role_assignment" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = var.policy_identity_role
  principal_id         = azurerm_policy_assignment.policy_assignment.identity[0].principal_id
}

resource "azurerm_policy_remediation" "policy_remediation" {
  for_each = {
    for policy_def in azurerm_policy_set_definition.policy_set.policy_definition_reference : "${policy_def.reference_id}" => {
      reference_id = lower(policy_def.reference_id)
    }
  }

  name                           = each.value.reference_id
  scope                          = data.azurerm_management_group.mg.id
  policy_assignment_id           = azurerm_policy_assignment.policy_assignment.id
  policy_definition_reference_id = each.value.reference_id
}