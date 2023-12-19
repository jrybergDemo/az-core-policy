terraform {
  required_providers {
    azurerm = "~> 3.84.0"
  }
  backend "azurerm" {}
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  alias                      = "admin"
  subscription_id            = var.admin_subscription_id
  skip_provider_registration = true
  features {}
}

data "azurerm_management_group" "mg" {
  name = var.policy_scope
}

data "azurerm_subscription" "current" {
}

data "azurerm_client_config" "current" {
}

locals {
  dcr_variable = flatten([
    for dcr_name, dcr_property in var.data_collection_rules : [
      for data_flows in dcr_property.data_flows : {
        dcr_name            = dcr_name
        os_type             = dcr_property.os_type
        log_type            = dcr_property.log_type
        data_sources_syslog = dcr_property.data_sources_syslog
        destinations        = data_flows.destinations
        destinations_rg     = data_flows.destinations_rg
        streams             = data_flows.streams
      }
    ]
  ])
}

data "azurerm_log_analytics_workspace" "security" {
  provider = azurerm.admin
  for_each = {
    for data_flows in local.dcr_variable :
    data_flows.dcr_name => data_flows
    if data_flows.log_type == "Security"
  }

  name                = join(", ", each.value.destinations)
  resource_group_name = join(", ", each.value.destinations_rg)
}

data "azurerm_log_analytics_workspace" "operational" {
  for_each = {
    for data_flows in local.dcr_variable :
    data_flows.dcr_name => data_flows
    if data_flows.log_type == "Operational"
  }

  name                = join(", ", each.value.destinations)
  resource_group_name = join(", ", each.value.destinations_rg)
}

data "azurerm_log_analytics_workspace" "vminsights" {
  name                = var.vminsights_dcr_law.name
  resource_group_name = var.vminsights_dcr_law.rg_name
}

resource "azurerm_resource_group" "rg" {
  name     = var.policy_identity_rg
  location = var.location
}

resource "azurerm_user_assigned_identity" "policy_id" {
  name                = var.policy_identity_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

resource "azurerm_monitor_data_collection_rule" "data_collection_rules_windows" {
  for_each = {
    for data_flows in local.dcr_variable :
    data_flows.dcr_name => data_flows
    if data_flows.os_type == "Windows"
  }

  name                = each.key
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  kind                = each.value.os_type

  destinations {
    dynamic "log_analytics" {
      for_each = {
        for item in [0] : item => item
        if each.value.log_type == "Operational"
      }
      content {
        workspace_resource_id = data.azurerm_log_analytics_workspace.operational[each.key].id
        name                  = join(", ", each.value.destinations)
      }
    }

    dynamic "log_analytics" {
      for_each = {
        for item in [0] : item => item
        if each.value.log_type == "Security"
      }
      content {
        workspace_resource_id = data.azurerm_log_analytics_workspace.security[each.key].id
        name                  = join(", ", each.value.destinations)
      }
    }
  }

  data_flow {
    streams      = each.value.streams
    destinations = each.value.destinations
  }

  data_sources {
    dynamic "windows_event_log" {
      for_each = {
        for item in [0] : item => item
        if each.value.log_type == "Operational"
      }
      content {
        streams        = each.value.streams
        x_path_queries = ["Security!*[System[(band(Keywords,13510798882111488))]]", "System!*[System[(Level=1 or Level=2 or Level=3)]]", "Application!*[System[(Level=1 or Level=2 or Level=3 or Level=4 or Level=5)]]"]
        name           = "eventLogsDataSource"
      }
    }

    dynamic "windows_event_log" {
      for_each = {
        for item in [0] : item => item
        if each.value.log_type == "Security"
      }
      content {
        streams        = each.value.streams
        x_path_queries = ["Security!*[System[(band(Keywords,13510798882111488))]]"]
        name           = "eventLogsDataSource"
      }
    }
  }
}

resource "azurerm_monitor_data_collection_rule" "data_collection_rules_linux" {
  for_each = {
    for data_flows in local.dcr_variable :
    data_flows.dcr_name => data_flows
    if data_flows.os_type == "Linux"
  }

  name                = each.key
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  kind                = each.value.os_type

  destinations {
    dynamic "log_analytics" {
      for_each = {
        for item in [0] : item => item
        if each.value.log_type == "Operational"
      }
      content {
        workspace_resource_id = data.azurerm_log_analytics_workspace.operational[each.key].id
        name                  = join(", ", [for s in each.value.destinations : format("%s", s)])
      }
    }

    dynamic "log_analytics" {
      for_each = {
        for item in [0] : item => item
        if each.value.log_type == "Security"
      }
      content {
        workspace_resource_id = data.azurerm_log_analytics_workspace.security[each.key].id
        name                  = join(", ", [for s in each.value.destinations : format("%s", s)])
      }
    }
  }

  data_flow {
    streams      = each.value.streams
    destinations = each.value.destinations
  }

  data_sources {
    dynamic "syslog" {
      for_each = {
        for k, v in each.value.data_sources_syslog : k => v
        if each.value.log_type == "Operational"
      }

      content {
        name           = "syslogs-${syslog.key}-${syslog.value}"
        facility_names = [syslog.key]
        log_levels     = [syslog.value]
      }
    }

    dynamic "syslog" {
      for_each = {
        for k, v in each.value.data_sources_syslog : k => v
        if each.value.log_type == "Security"
      }

      content {
        name           = "syslogs-${syslog.key}-${syslog.value}"
        facility_names = [syslog.key]
        log_levels     = [syslog.value]
      }
    }
  }
}

resource "azurerm_monitor_data_collection_rule" "data_collection_rules_vminsights" {
  name                = "MSVMI-${var.dcr_info.vminsights_dcr_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  description         = "Windows & Linux VMInsights and Performance Counter Data Collection Rule"

  data_sources {
    performance_counter {
      name                          = "PerfCounterDataSources"
      streams                       = ["Microsoft-Perf"]
      sampling_frequency_in_seconds = 60
      counter_specifiers = [
        "\\Processor Information(_Total)\\% Processor Time"
      ]
    }

    performance_counter {
      name                          = "VMInsightsPerfCounters"
      streams                       = ["Microsoft-InsightsMetrics"]
      sampling_frequency_in_seconds = 60
      counter_specifiers = [
        "\\VmInsights\\DetailedMetrics"
      ]
    }
  }

  destinations {
    log_analytics {
      workspace_resource_id = data.azurerm_log_analytics_workspace.vminsights.id
      name = "la-${var.vminsights_dcr_law.name}"
    }
  } 

  data_flow {
    streams       = ["Microsoft-Perf", "Microsoft-InsightsMetrics"]
    destinations  = ["la-${var.vminsights_dcr_law.name}"]
  } 

  identity {
    type    = "SystemAssigned"
  }
}

resource "azurerm_policy_definition" "policy_defs_custom" {
  for_each = {
    for policy, type in var.policy_list : policy => type
    if type.policy_type == "Custom"
  }

  name                = each.key
  description         = lookup(each.value, "description", "")
  management_group_id = data.azurerm_management_group.mg.id
  policy_type         = "Custom"
  metadata            = each.value.metadata
  mode                = lookup(each.value, "mode", "")
  display_name        = each.key
  policy_rule         = file(each.value.rule_path)
  parameters          = file(each.value.parameters_path)
}

resource "azurerm_policy_set_definition" "policy_set" {
  depends_on          = [azurerm_policy_definition.policy_defs_custom]
  name                = var.policy_set_name
  management_group_id = data.azurerm_management_group.mg.id
  policy_type         = var.policy_type
  display_name        = var.policy_set_name
  parameters          = var.policy_set_parameters

  #Add policies from policy_list variable
  dynamic "policy_definition_reference" {
    for_each = var.policy_list

    content {
      policy_definition_id = lookup(policy_definition_reference.value, "id", "/providers/Microsoft.Management/managementgroups/${data.azurerm_management_group.mg.name}/providers/Microsoft.Authorization/policyDefinitions/${policy_definition_reference["key"]}")
      parameter_values     = lookup(policy_definition_reference.value, "parameters", "")
      reference_id         = lookup(policy_definition_reference.value, "name", policy_definition_reference["key"])
    }
  }
}

resource "azurerm_management_group_policy_assignment" "policy_assignment" {
  depends_on = [
    azurerm_policy_set_definition.policy_set,
    azurerm_user_assigned_identity.policy_id,
    azurerm_monitor_data_collection_rule.data_collection_rules_windows,
    azurerm_monitor_data_collection_rule.data_collection_rules_linux,
    azurerm_monitor_data_collection_rule.data_collection_rules_vminsights
  ]

  name                 = var.policy_set_name
  management_group_id  = data.azurerm_management_group.mg.id
  policy_definition_id = azurerm_policy_set_definition.policy_set.id
  description          = var.policy_description
  display_name         = var.policy_set_name
  not_scopes           = var.policy_exclude_rg_ids_list
  location             = var.location
  parameters           = <<-EOT
    {
      "diagnosticsSettingName": {
        "value": "${var.diagnostics_setting_name}"
      },
      "logAnalytics": {
        "value": "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.log_analytics_rg_name}/providers/Microsoft.OperationalInsights/workspaces/${var.log_analytics_name}"
      },
      "storageAccount": {
        "value": "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.storage_account_rg_name}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_name}"
      },
      "storageAccountTx": {
        "value": "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.storage_account_tx_rg_name}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_tx_name}"
      },
      "listOfWindowsImageIdToInclude": {
        "value": ${var.custom_windows_image_ids_list}
      },
      "listOfLinuxImageIdToInclude": {
        "value": ${var.custom_linux_image_ids_list}
      },
      "retentionPolicy_days": {
        "value": ${var.flow_logs_retention_policy_days}
      },
      "trafficAnalyticsInterval_min": {
        "value": ${var.flow_logs_traffic_analytics_interval_min}
      },
      "windowsDcrResourceId": {
        "value": "${azurerm_monitor_data_collection_rule.data_collection_rules_windows[var.dcr_info.windows_security_dcr_name].id}"
      },
      "windowsDcrResourceIdOperational": {
        "value": "${azurerm_monitor_data_collection_rule.data_collection_rules_windows[var.dcr_info.windows_operational_dcr_name].id}"
      },
      "linuxDcrResourceIdOperational": {
        "value": "${azurerm_monitor_data_collection_rule.data_collection_rules_linux[var.dcr_info.linux_operational_dcr_name].id}"
      },
      "linuxDcrResourceId": {
        "value": "${azurerm_monitor_data_collection_rule.data_collection_rules_linux[var.dcr_info.linux_security_dcr_name].id}"
      },
      "vmInsightsDcrResourceId": {
        "value": "${azurerm_monitor_data_collection_rule.data_collection_rules_vminsights.id}"
      }
    }
    EOT

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.policy_id.id]
  }
}

resource "azurerm_role_assignment" "managedidentityroleassignments" {
  for_each             = var.managed_identity_roles
  scope                = azurerm_resource_group.rg.id
  role_definition_name = each.key
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_management_lock" "policy_id_lock" {
  depends_on = [azurerm_role_assignment.managedidentityroleassignments]
  name       = "PolicyLock"
  scope      = azurerm_user_assigned_identity.policy_id.id
  lock_level = "ReadOnly"
  notes      = "ID cannot be deleted because it has assignments on MG that we cannot recreate"
}

