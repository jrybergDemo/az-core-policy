policy_set_name = "Contoso_Monitoring"
policy_type = "Custom"
policy_mode = "All"
policy_description = "Contoso Monitoring policies to monitor all resources."
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
    "metricsEnabled": {
      "type": "String",
      "metadata": {
        "displayName": "Enable metrics",
        "description": "Whether to enable metrics stream to the Log Analytics workspace - True or False"
      },
      "allowedValues": [
        "True",
        "False"
      ],
      "defaultValue": "False"
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
    "diagnosticsSettingSAName": {
      "type": "String",
      "defaultValue": "setByPolicySA",
      "metadata": {
        "displayName": "Setting name for monitoring with Storage Account"
      }
    },
    "diagnosticsSettingLAName": {
      "type": "String",
      "defaultValue": "setByPolicyLA",
      "metadata": {
        "displayName": "Setting name for monitoring with Log Analytics"
      }
    }
  }
  EOT

policy_list = {
  "0868462e-646c-4fe3-9ced-a733534b6a2c" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0868462e-646c-4fe3-9ced-a733534b6a2c"
    name = "Deploy Log Analytics agent for Windows VMs"
    parameters = <<-EOT
    {
      "logAnalytics": {"value": "[parameters('logAnalytics')]"}
    }
    EOT
  }
  "053d3325-282c-4e5c-b944-24faffd30d77" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/053d3325-282c-4e5c-b944-24faffd30d77"
    name = "Deploy Log Analytics agent for Linux VMs"
    parameters = <<-EOT
    {
      "logAnalytics": {"value": "[parameters('logAnalytics')]"}
    }
    EOT
  }
  "1c210e94-a481-4beb-95fa-1571b434fb04" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1c210e94-a481-4beb-95fa-1571b434fb04"
    name = "Deploy Dependency agent for Windows virtual machines"
  }
  "4da21710-ce6f-4e06-8cdb-5cc4c93ffbee" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/4da21710-ce6f-4e06-8cdb-5cc4c93ffbee"
    name = "Deploy Dependency agent for Linux virtual machines"
  }
  "11ac78e3-31bc-4f0c-8434-37ab963cea07" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/11ac78e3-31bc-4f0c-8434-37ab963cea07"
    name = "Audit Dependency agent deployment - VM Image (OS) unlisted"
  }
  "7ea8a143-05e3-4553-abfe-f56bef8b0b70" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/7ea8a143-05e3-4553-abfe-f56bef8b0b70"
    name = "Deploy - Configure diagnostic settings for Azure SQL Database server to Log Analytics workspace"
    parameters = <<-EOT
    {
      "logAnalyticsWorkspaceId": {"value": "[parameters('logAnalytics')]"}
    }
    EOT
  }
  "b79fa14e-238a-4c2d-b376-442ce508fc84" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/b79fa14e-238a-4c2d-b376-442ce508fc84"
    name = "Deploy - Configure diagnostic settings for SQL Databases to Log Analytics workspace"
    parameters = <<-EOT
    {
      "logAnalytics": {"value": "[parameters('logAnalytics')]"}
    }
    EOT
  }
  "bef3f64c-5290-43b7-85b0-9b254eef4c47" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/bef3f64c-5290-43b7-85b0-9b254eef4c47"
    name = "Deploy Diagnostic Settings for Key Vault to Log Analytics workspace"
    parameters = <<-EOT
    {
      "logAnalytics": {"value": "[parameters('logAnalytics')]"},
      "metricsEnabled": {"value": "[parameters('metricsEnabled')]"}
    }
    EOT
  }
}

sa_policy_def_parameters = {
  storageAccount = "[parameters('storageAccount')]"
  diagnosticsSettingName = "[parameters('diagnosticsSettingSAName')]"
}

sa_policy_def_list = {
    "Apply diagnostic settings for Vnet Gateway - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Virtual Network Gateway to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/vnetgw-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Key Vaults - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Key Vault to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/kv-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Azure Backup - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Backup to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/bk-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Data Lake and SA- Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for ADLS to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/storage-dl-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Virtual Network - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Virtual Network to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/vnet-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Azure Bastion - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Bastion to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/bastion-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Synapse - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Synapse to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/synapse-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for ADF - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Data Factory to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/adf-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Server SQL Pool - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Synapse SQL Pool to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/sql-server-sql-pool-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Elastic Pools - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Elastic Pools to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/elastic-pools-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for NSG - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Network Security Group to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/nsg-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Netwrk Inter - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Network Security Group to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/network-interface-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for PostgreSQL DB - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for PostgreSQL DB to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/postgresql-db-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for SynapseSQL pools - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Synapse SQL pools to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/synapse-sql-pools-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Express Route - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Express Route Circuits to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/express-route-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Databks Wkspce - Storage Account" = {
    description = "This policy automatically deploys and enable diagnostic settings for Databricks workspace to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/databricks-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
  "Apply diagnostic settings for Auto Account - Storage Accout" = {
    description = "This policy automatically deploys and enable diagnostic settings for Automation Accounts to Storage Account"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/aa-sa.json"
    parameters_path = "custom_policies/sa.parameters.json"
  }
}

la_policy_def_parameters = {
  logAnalytics = "[parameters('logAnalytics')]"
  diagnosticsSettingName = "[parameters('diagnosticsSettingLAName')]"
}

la_policy_def_list = {
  "Apply diagnostic settings for Vnet Gateway - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Virtual Network Gateway to Log Analytics"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/vnetgw-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Virtual Network - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Virtual Network to Log Analytics"
    mode = "All"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/vnet-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Azure Backup - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Backup to Log Analytics"
    mode = "All"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/bk-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Data Lake and SA - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Storage Account and ADLS to Log Analytics"
    mode = "All"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/storage-dl-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Azure Bastion - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Bastion to Log Analytics"
    mode = "All"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/bastion-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Server SQL Pool - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure (SQL Server) SQL Pool to Log Analytics Workspace"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/sql-server-sql-pool-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Synapse - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Synapse to Log Analytics"
    mode = "All"
    metadata = <<METADATA
    {
      "catagory": "Monitoring",
      "version": "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/synapse-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for ADF - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure Data Factory to  Log Analytics Workspace"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/adf-la.json"
    parameters_path = "custom_policies/adf-la.parameters.json"
  }
  "Apply diagnostic settings for Server SQL Pool - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Azure (SQL Server) SQL Pool to Log Analytics Workspace"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/sql-server-sql-pool-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Elastic Pool - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Elastic Pools to Log Analytics Workspace"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/elastic-pools-la.json"
    parameters_path = "custom_policies/la.parameters.json"
 }
  "Apply diagnostic settings for NSG - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Network Security Group to Log Analytics Workspace"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/nsg-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Netwrk Inter - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Network Security Group to Log Analytics Workspace"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/network-interface-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for PostgreSQL DB - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for PostgreSQL DB to Log Analytics Workspace"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/postgresql-db-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for SynapseSQL pools - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Synapse SQL pools to Log Analytics Workspace"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/synapse-sql-pools-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Express Route - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Express Route Circuits to Log Analytics"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/express-route-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Databks Wkspce - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Databricks workspace to Log Analytics"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/databricks-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
  "Apply diagnostic settings for Auto Account - Log Analytics" = {
    description = "This policy automatically deploys and enable diagnostic settings for Automation Accounts to Log Analytics"
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Monitoring",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/aa-la.json"
    parameters_path = "custom_policies/la.parameters.json"
  }
}

