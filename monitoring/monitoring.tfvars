policy_set_name = "EITaaS_Monitoring"
policy_type = "Custom"
policy_mode = "All"
policy_description = "Eitaas Monitoring policies to monitor all resources."
policy_set_parameters = <<-EOT
  {
    "logAnalytics": {
      "type": "String",
      "metadata": {
        "displayName": "Log Analytics workspace",
        "description": "Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant 'Log Analytics Contributor' permissions (or similar) to the policy assignment's principal ID.",
        "strongType": "omsWorkspace",
        "assignPermissions": true
      }
    },
    "storageAccount": {
      "type": "String",
      "metadata": {
        "displayName": "Storage Account reference",
        "description": "Set the full path (resourceId) to the target storage account for diagnostics events.",
        "assignPermissions": true
      },
      "defaultValue": "THISVALUEWILLBEREPLACED"
    },
    "storageAccountTx": {
      "type": "String",
      "metadata": {
        "displayName": "Storage Account reference in TX region",
        "description": "Set the full path (resourceId) to the target storage account for diagnostics events TX region.",
        "assignPermissions": true
      },
      "defaultValue": "THISVALUEWILLBEREPLACED"
    },
    "diagnosticsSettingName": {
      "type": "String",
      "defaultValue": "eitaas-monitoring-policy",
      "metadata": {
        "displayName": "Setting name for monitoring with Storage Account"
      }
    },
    "listOfWindowsImageIdToInclude": {
      "type": "Array",
      "metadata": {
        "displayName": "List of custom Windows images ids to apply extensions for VM agents"
      }
    },
    "listOfLinuxImageIdToInclude": {
      "type": "Array",
      "metadata": {
        "displayName": "List of custom Linux images ids to apply extensions for VM agents"
      }
    },
    "retentionPolicy_days": {
      "type": "Integer",
      "defaultValue": 0,
      "metadata": {
        "displayName": "The flow log retention storage in days. Use 0 for 'forever'."
      }
    },
    "trafficAnalyticsInterval_min": {
      "type": "Integer",
      "defaultValue": 60,
      "metadata": {
        "displayName": "The flow log workspace analytics interval in minutes. Valid values are 10 and 60."
      }
    },
    "windowsDcrResourceId": {
      "type": "String",
      "metadata": {
        "displayName": "Data Collection Rule (DCR) Resource Id for Windows Security Logs"
      }
    },
    "windowsDcrResourceIdOperational": {
      "type": "String",
      "metadata": {
        "displayName": "Data Collection Rule (DCR) Resource Id for Windows Operation Logs"
      }
    },
    "linuxDcrResourceId": {
      "type": "String",
      "metadata": {
        "displayName": "Data Collection Rule (DCR) Resource Id for Linux Security Logs"
      }
    },
    "linuxDcrResourceIdOperational": {
      "type": "String",
      "metadata": {
        "displayName": "Data Collection Rule (DCR) Resource Id for Linux Operation Logs"
      }
    },
    "vmInsightsDcrResourceId": {
      "type": "String",
      "metadata": {
        "displayName": "Data Collection Rule (DCR) Resource Id for both Windows and Linux VM Insights"
      },
      "defaultValue": "THISVALUEWILLBEREPLACED"
    }
  }
  EOT

policy_list = {
###built in policies###
  "89ca9cc7-25cd-4d53-97ba-445ca7a1f222" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/89ca9cc7-25cd-4d53-97ba-445ca7a1f222"
    name = "Deploy Dependency agent for Windows virtual machines with Azure Monitoring Agent settings"
    parameters = <<-EOT
    {
      "listOfImageIdToInclude": {"value": "[parameters('listOfWindowsImageIdToInclude')]"}
    }
    EOT
    policy_type = "BuiltIn"
  }
  "d55b81e1-984f-4a96-acab-fae204e3ca7f" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/d55b81e1-984f-4a96-acab-fae204e3ca7f"
    name = "Deploy Dependency agent for Linux virtual machines with Azure Monitoring Agent settings"
    parameters = <<-EOT
    {
      "listOfImageIdToInclude": {"value": "[parameters('listOfLinuxImageIdToInclude')]"}
    }
    EOT
    policy_type = "BuiltIn"
  }
  "11ac78e3-31bc-4f0c-8434-37ab963cea07" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/11ac78e3-31bc-4f0c-8434-37ab963cea07"
    name = "Audit - Dependency agent should be enabled for listed virtual machine images"
    parameters = <<-EOT
    {
      "listOfImageIdToInclude_windows": {"value": "[parameters('listOfWindowsImageIdToInclude')]"},
      "listOfImageIdToInclude_linux": {"value": "[parameters('listOfLinuxImageIdToInclude')]"}
    }
    EOT
    policy_type = "BuiltIn"
  }
  "eab1f514-22e3-42e3-9a1f-e1dc9199355c-vminsights" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/eab1f514-22e3-42e3-9a1f-e1dc9199355c"
    name = "Configure Windows Machines to be associated with a Data Collection Rule - VMInsights"
    parameters = <<-EOT
    {
      "listOfWindowsImageIdToInclude": {"value": "[parameters('listOfWindowsImageIdToInclude')]"},
      "dcrResourceId": {"value": "[parameters('vmInsightsDcrResourceId')]"}
    }
    EOT
    policy_type = "BuiltIn"
  }
  "eab1f514-22e3-42e3-9a1f-e1dc9199355c-operational" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/eab1f514-22e3-42e3-9a1f-e1dc9199355c"
    name = "Configure Windows Machines to be associated with a Data Collection Rule - Operational"
    parameters = <<-EOT
    {
      "listOfWindowsImageIdToInclude": {"value": "[parameters('listOfWindowsImageIdToInclude')]"},
      "dcrResourceId": {"value": "[parameters('windowsDcrResourceIdOperational')]"}
    }
    EOT
    policy_type = "BuiltIn"
  }
  "eab1f514-22e3-42e3-9a1f-e1dc9199355c-Security" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/eab1f514-22e3-42e3-9a1f-e1dc9199355c"
    name = "Configure Windows Machines to be associated with a Data Collection Rule - Security"
    parameters = <<-EOT
    {
      "listOfWindowsImageIdToInclude": {"value": "[parameters('listOfWindowsImageIdToInclude')]"},
      "dcrResourceId": {"value": "[parameters('windowsDcrResourceId')]"}
    }
    EOT
    policy_type = "BuiltIn"
  }
  "2ea82cdd-f2e8-4500-af75-67a2e084ca74-vminsights" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2ea82cdd-f2e8-4500-af75-67a2e084ca74"
    name = "Configure Linux Machines to be associated with a Data Collection Rule - VMInsights"
    parameters = <<-EOT
    {
      "listOfLinuxImageIdToInclude": {"value": "[parameters('listOfLinuxImageIdToInclude')]"},
      "dcrResourceId": {"value": "[parameters('vmInsightsDcrResourceId')]"}
    }
    EOT
    policy_type = "BuiltIn"
  }
  "2ea82cdd-f2e8-4500-af75-67a2e084ca74-operational" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2ea82cdd-f2e8-4500-af75-67a2e084ca74"
    name = "Configure Linux Machines to be associated with a Data Collection Rule - Operational"
    parameters = <<-EOT
    {
      "listOfLinuxImageIdToInclude": {"value": "[parameters('listOfLinuxImageIdToInclude')]"},
      "dcrResourceId": {"value": "[parameters('linuxDcrResourceIdOperational')]"}
    }
    EOT
    policy_type = "BuiltIn"
  }
  "2ea82cdd-f2e8-4500-af75-67a2e084ca74-Security" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2ea82cdd-f2e8-4500-af75-67a2e084ca74"
    name = "Configure Linux Machines to be associated with a Data Collection Rule - Security"
    parameters = <<-EOT
    {
      "listOfLinuxImageIdToInclude": {"value": "[parameters('listOfLinuxImageIdToInclude')]"},
      "dcrResourceId": {"value": "[parameters('linuxDcrResourceId')]"}
    }
    EOT
    policy_type = "BuiltIn"
  }
  "496e010e-fa91-4c00-be4b-92b481f67b58" = {
    policy_type = "BuiltIn"
    id = "/providers/Microsoft.Authorization/policyDefinitions/496e010e-fa91-4c00-be4b-92b481f67b58"
    name = "Configure VMs created with Shared Image Gallery images to install the Guest Attestation extension"
  }
#### Custom Policy Lists ####
  "Apply diagnostic settings for Key Vaults" = {
    description = "This policy automatically deploys and enable diagnostic settings for Key Vault to Storage Account"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/keyvault.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Vnet Gateway" = {
    description = "This policy automatically deploys and enable diagnostic settings for Virtual Network Gateway to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/vnetgw.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Virtual Network" = {
    description = "This policy automatically deploys and enable diagnostic settings for Virtual Network to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/vnet.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Azure Backup" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Backup to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/backup-recovery.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Azure Bastion" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Bastion to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/bastion.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Server SQL Pool" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure (SQL Server) SQL Pool to Log Analytics Workspace"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/sql-server-sql-pool.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Synapse" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Synapse to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/synapse.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Elastic Pool" = {
    description = "This policy automatically deploys and enable diagnostic settings for Elastic Pools to Log Analytics Workspace"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/elastic-pools.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
 }
  "Apply diagnostic settings for Machine Learning" = {
    description = "This policy automatically deploys and enable diagnostic settings for Machine Learning"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/machine-learning.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for NSG" = {
    description = "This policy automatically deploys and enable diagnostic settings for Network Security Group to Log Analytics Workspace"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/nsg.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply flow log resource for NSG" = {
    description = "This policy automatically deploys and enable Flow Logs for Network Security Group to Log Analytics Workspace"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/nsg-flow-logs.json"
    parameters_path = "custom_policies/nsg-flow-logs.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "retentionPolicy_days": {"value": "[parameters('retentionPolicy_days')]"},
      "trafficAnalyticsInterval_min": {"value": "[parameters('trafficAnalyticsInterval_min')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Network Interface" = {
    description = "This policy automatically deploys and enable diagnostic settings for Network Interface Card to Log Analytics Workspace"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/network-interface.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for PostgreSQL DB" = {
    description = "This policy automatically deploys and enable diagnostic settings for PostgreSQL DB to Log Analytics Workspace"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/postgresql-db.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for SynapseSQL pools" = {
    description = "This policy automatically deploys and enable diagnostic settings for Synapse SQL pools to Log Analytics Workspace"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/synapse-sql-pools.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Express Route" = {
    description = "This policy automatically deploys and enable diagnostic settings for Express Route Circuits to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/express-route.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Databricks Workspace" = {
    description = "This policy automatically deploys and enable diagnostic settings for Databricks workspace to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/databricks.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for SQL Database" = {
    description = "This policy automatically deploys and enable diagnostic settings for SQL Database to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/sql-db.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
   "Apply diagnostic settings for Public IPs" = {
    description = "This policy automatically deploys and enable diagnostic settings for Public IPs to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/pip.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
   "Apply diagnostic settings for App Service Environments" = {
    description = "This policy automatically deploys and enable diagnostic settings for App Service Environments to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/app-service-environment.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Cosmos DB" = {
    description = "This policy automatically deploys and enable diagnostic settings for Cosmos DB to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/cosmos-db.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Application Gateway" = {
    description = "This policy automatically deploys and enable diagnostic settings for Application Gateway to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/application-gateway.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for MySQL DB" = {
    description = "This policy automatically deploys and enable diagnostic settings for MYSQL DB to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/mysql-db.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Azure App Service" = {
    description = "This policy automatically deploys and enable diagnostic settings for App Service to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/app-service.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Azure App Service Plan" = {
    description = "This policy automatically deploys and enable diagnostic settings for App Service Plan to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/app-service-plan.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Azure Function App" = {
    description = "This policy automatically deploys and enable diagnostic settings for Function App to Log Analytics"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/function-app.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
#### Diagnostics logs to Log Analytics & Storage Account Policy Lists ####
  "Apply diagnostic settings for Automation Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Automation Accounts to Log Analytics and Storage Account"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/automation-account.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "storageAccount" : {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "diagnosticsSettingName" : {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Azure Data Factory (ADF)" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Data Factory to Log Analytics and Storage Account"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/data-factory.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Storage Account (Blob, Queue, Table, File) to Log Analytics & Storage Account"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/storage-account.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
  "Apply diagnostic settings for Logic Apps" = {
    description = "This policy automatically deploys and enable diagnostic settings for Logic Apps to Log Analytics & Storage Account"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/logic-apps.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "storageAccount": {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "diagnosticsSettingName": {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
#### SQL Server Audit Policy Lists ####
  "Apply diagnostic settings for SQL Servers - Audit Settings" = {
    description = "This policy automatically deploys and enable diagnostic settings for SQL servers to Storage Account"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/sql-server-audit.json"
    parameters_path = "custom_policies/diagnostic.parameters.json"
    parameters = <<-EOT
    {
      "storageAccount" : {"value": "[parameters('storageAccount')]"},
      "storageAccountTx": {"value": "[parameters('storageAccountTx')]"},
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "diagnosticsSettingName" : {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
#### Subscription level policies ####
  "Apply diagnostic settings for Activity Logs" = {
    description = "This policy automatically deploys and enable diagnostic settings for Activity Logs at Subscription Level"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/subscription-activity-logs.json"
    parameters_path = "custom_policies/activity-logs.parameters.json"
    parameters = <<-EOT
    {
      "storageAccount" : {"value": "[parameters('storageAccount')]"},
      "logAnalytics" : {"value": "[parameters('logAnalytics')]"},
      "diagnosticsSettingName" : {"value": "[parameters('diagnosticsSettingName')]"}
    }
    EOT
  }
#### Azure Monitor Agent policies ####
  "Add Azure Monitor Agent to Windows VMs" = {
    description = "This policy adds Azure Monitor Agent to Windows Machines"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/azure-monitor-agent-windows.json"
    parameters_path = "custom_policies/azure-monitor-agent.parameters.json"
    parameters = <<-EOT
    {
      "listOfImageIdsToInclude": {"value": "[parameters('listOfWindowsImageIdToInclude')]"}
    }
    EOT
  }
  "Add Azure Monitor Agent to Linux VMs" = {
      description = "This policy adds Azure Monitor Agent to Linux Machines"
      mode="All"
      policy_type = "Custom"
      metadata = <<METADATA
      {
        "category": "Monitoring",
        "version" : "1.0.0"
      }
      METADATA
      rule_path = "custom_policies/azure-monitor-agent-linux.json"
      parameters_path = "custom_policies/azure-monitor-agent.parameters.json"
      parameters = <<-EOT
      {
        "listOfImageIdsToInclude": {"value": "[parameters('listOfLinuxImageIdToInclude')]"}
      }
      EOT
  }
#### Azure Monitor Agent policies Virtual Machine Scale Sets ####
 "Add Azure Monitor Agent to Windows VMSSs" = {
    description = "This policy adds Azure Monitor Agent to Windows VMSS"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/azure-monitor-agent-windows-vmss.json"
    parameters_path = "custom_policies/azure-monitor-agent.vmss.parameters.json"
    parameters = <<-EOT
    {
    }
    EOT
  }
  "Add Azure Monitor Agent to Linux VMSSs" = {
      description = "This policy adds Azure Monitor Agent to Linux VMSS"
      mode="All"
      policy_type = "Custom"
      metadata = <<METADATA
      {
        "category": "Monitoring",
        "version" : "1.0.0"
      }
      METADATA
      rule_path = "custom_policies/azure-monitor-agent-linux-vmss.json"
      parameters_path = "custom_policies/azure-monitor-agent.vmss.parameters.json"
      parameters = <<-EOT
      {
      }
      EOT
  }
#### Azure Monitor Agent policies Arc-enabled Hybrid servers ####
  "Add Azure Monitor Agent to Windows Arc-enabled VMs" = {
    description = "This policy adds Azure Monitor Agent to Windows Arc-enabled Machines"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/azure-monitor-agent-windows-hybrid.json"
    parameters_path = "custom_policies/azure-monitor-agent.hybrid.parameters.json"
    parameters = <<-EOT
    {
    }
    EOT
  }
  "Add Azure Monitor Agent to Linux Arc-enabled VMs" = {
    description = "This policy adds Azure Monitor Agent to Linux Arc-enabled Machines"
    mode="All"
    policy_type = "Custom"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/azure-monitor-agent-linux-hybrid.json"
    parameters_path = "custom_policies/azure-monitor-agent.hybrid.parameters.json"
    parameters = <<-EOT
    {
    }
    EOT
  }
}