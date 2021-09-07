policy_set_name = "Contoso_Governance"
policy_type = "Custom"
policy_mode = "All"
policy_description = "Contoso Governance policy for settings not directly related to accreditation."
policy_set_parameters = <<-EOT
  {
    "listOfAllowedVMSKUs": {
      "type": "Array",
      "metadata": {
        "description": "The list of size SKUs that can be specified for virtual machines.",
        "displayName": "Allowed Size SKUs",
        "strongType": "VMSKUs"
      },
      "defaultValue": [
        "Standard_D16s_v3",
        "Standard_D16s_v4",
        "Standard_D2s_v3",
        "Standard_D8s_v3",
        "Standard_DS12-2_v2",
        "Standard_DS3_v2"
      ]
    },
    "listOfResourceTypesAllowed": {
      "type": "Array",
      "metadata": {
        "description": "The list of resource types that can be deployed.",
        "displayName": "Allowed resource types",
        "strongType": "resourceTypes"
      },
      "defaultValue": [
        "Microsoft.AlertsManagement/smartDetectorAlertRules",
        "Microsoft.AppConfiguration/configurationStores",
        "Microsoft.Authorization/locks",
        "Microsoft.Automation/automationAccounts",
        "Microsoft.Automation/automationAccounts/runbooks",
        "Microsoft.Automation/automationAccounts/configurations",
        "microsoft.botservice/botservices",
        "microsoft.cognitiveservices/accounts",
        "Microsoft.Compute/availabilitySets",
        "Microsoft.Compute/diskEncryptionSets",
        "Microsoft.Compute/disks",
        "Microsoft.Compute/images",
        "Microsoft.Compute/galleries",
        "Microsoft.Compute/galleries/images",
        "Microsoft.Compute/galleries/images/versions",
        "Microsoft.Compute/hostGroups",
        "Microsoft.Compute/hostGroups/hosts",
        "Microsoft.Compute/restorePointCollections",
        "Microsoft.Compute/virtualMachines",
        "Microsoft.Compute/virtualMachines/extensions",
        "Microsoft.Databricks/workspaces",
        "Microsoft.DataFactory/factories",
        "Microsoft.DBforMySQL/servers",
        "Microsoft.DBforMySQL/servers/configurations",
        "Microsoft.DBforMySQL/servers/databases",
        "Microsoft.DBforMySQL/servers/securityAlertPolicies",
        "Microsoft.DBforMySQL/servers/virtualNetworkRules",
        "Microsoft.DBforPostgreSQL/operations",
        "Microsoft.DBforPostgreSQL/servers",
        "Microsoft.DBforPostgreSQL/servers/servers/recoverableServers",
        "Microsoft.DBforPostgreSQL/servers/virtualNetworkRules",
        "Microsoft.DBforPostgreSQL/servers/topQueryStatistics",
        "Microsoft.DBforPostgreSQL/servers/queryTexts",
        "Microsoft.DBforPostgreSQL/servers/privateEndpointConnections",
        "Microsoft.DBforPostgreSQL/servers/privateEndpointConnectionProxies",
        "Microsoft.DevTestLab/labs",
        "Microsoft.DevTestLab/labs/environments",
        "Microsoft.DevTestLab/schedules",
        "microsoft.documentdb/databaseaccounts",
        "Microsoft.EventHub/availableClusterRegions",
        "Microsoft.EventHub/checkNameAvailability",
        "Microsoft.EventHub/checkNamespaceAvailability",
        "Microsoft.EventHub/clusters",
        "Microsoft.EventHub/locations",
        "Microsoft.EventHub/locations/deleteVirtualNetworkOrSubnets",
        "Microsoft.EventHub/namespaces",
        "Microsoft.EventHub/namespaces/authorizationrules",
        "Microsoft.EventHub/namespaces/disasterrecoveryconfigs",
        "Microsoft.EventHub/namespaces/disasterrecoveryconfigs/checkNameAvailability",
        "Microsoft.EventHub/namespaces/eventhubs",
        "Microsoft.EventHub/namespaces/eventhubs/authorizationrules",
        "Microsoft.EventHub/namespaces/eventhubs/consumergroups",
        "Microsoft.EventHub/namespaces/networkrulesets",
        "Microsoft.EventHub/operations",
        "Microsoft.EventHub/sku",
        "Microsoft.HybridCompute/locations",
        "Microsoft.HybridCompute/locations/operationResults",
        "Microsoft.HybridCompute/locations/operationStatus",
        "Microsoft.HybridCompute/machines",
        "Microsoft.HybridCompute/machines/extensions",
        "Microsoft.HybridCompute/operations",
        "microsoft.insights/actiongroups",
        "microsoft.insights/activityLogAlerts",
        "microsoft.insights/autoscalesettings",
        "microsoft.insights/components",
        "microsoft.insights/workbooks",
        "Microsoft.KeyVault/vaults",
        "Microsoft.Kusto/clusters",
        "Microsoft.Kusto/clusters/databases",
        "Microsoft.Logic/integrationAccounts",
        "Microsoft.Logic/integrationServiceEnvironments",
        "Microsoft.Logic/integrationServiceEnvironments/managedApis",
        "Microsoft.Logic/locations",
        "Microsoft.Logic/locations/workflows",
        "Microsoft.Logic/operations",
        "Microsoft.Logic/workflows",
        "Microsoft.ManagedIdentity/userAssignedIdentities",
        "Microsoft.Network/applicationGateways",
        "Microsoft.Network/applicationSecurityGroups",
        "Microsoft.Network/bastionHosts",
        "Microsoft.Network/connections",
        "Microsoft.Network/expressRouteCircuits",
        "Microsoft.Network/expressRouteCircuits/authorizations",
        "Microsoft.Network/expressRouteCircuits/peerings",
        "Microsoft.Network/expressRouteCircuits/peerings/connections",
        "Microsoft.Network/expressRouteCrossConnections",
        "Microsoft.Network/expressRouteCrossConnections/peerings",
        "Microsoft.Network/expressRouteGateways",
        "Microsoft.Network/expressRouteGateways/expressRouteConnections",
        "Microsoft.Network/ExpressRoutePorts",
        "Microsoft.Network/loadBalancers",
        "Microsoft.Network/natGateways",
        "Microsoft.Network/networkInterfaces",
        "Microsoft.Network/networkSecurityGroups",
        "Microsoft.Network/networkWatchers",
        "Microsoft.Network/networkWatchers/flowLogs",
        "Microsoft.Network/privateEndpoints",
        "Microsoft.Network/publicIPAddresses",
        "Microsoft.Network/routeFilters",
        "Microsoft.Network/routeTables",
        "Microsoft.Network/virtualHubs",
        "Microsoft.Network/virtualHubs/hubRouteTables",
        "Microsoft.Network/virtualWans",
        "Microsoft.Network/virtualNetworks",
        "Microsoft.Network/virtualNetworkGateways",
        "Microsoft.OperationalInsights/workspaces",
        "Microsoft.OperationsManagement/solutions",
        "microsoft.policyinsights/remediations",
        "Microsoft.RecoveryServices/vaults",
        "Microsoft.Resources/deployments",
        "Microsoft.Resources/checkPolicyCompliance",
        "microsoft.search/searchservices",
        "Microsoft.Sql/servers",
        "Microsoft.Sql/servers/databases",
        "Microsoft.Sql/servers/elasticpools",
        "Microsoft.Storage/storageAccounts",
        "Microsoft.Synapse/workspaces",
        "Microsoft.Synapse/workspaces/bigDataPools",
        "Microsoft.Synapse/workspaces/sqlPools",
        "Microsoft.Web/connections",
        "microsoft.web/hostingenvironments",
        "microsoft.web/serverfarms",
        "microsoft.web/sites"
      ]
    },
    "approvedExtensions": {
      "type": "Array",
      "metadata": {
        "description": "The list of approved extension types that can be installed. Example: AzureDiskEncryption",
        "displayName": "Approved extensions"
      },
      "defaultValue": [
        "azurenetworkwatcherextension",
        "databricksbootstrap",
        "dependencyagentlinux",
        "dependencyagentwindows",
        "dscforlinux",
        "enablevmaccess",
        "iaasdiagnostics",
        "linuxdiagnostic",
        "microsoft.insights.vmdiagnosticssettings",
        "microsoft.powershell.dsc",
        "microsoftmonitoringagent",
        "omsagentforlinux",
        "omsextension",
        "postdeploy",
        "postinstall",
        "powerstig"
      ]
    },
    "listOfAllowedSASKUs": {
      "type": "Array",
      "metadata": {
        "description": "The list of SKUs that can be specified for storage accounts.",
        "displayName": "Allowed SKUs",
        "strongType": "StorageSKUs"
      },
      "defaultValue": [ "Standard_GRS", "Standard_RAGRS", "Standard_GZRS", "Standard_RAGZRS", "Premium_LRS" ]
    },
    "effect": {
      "type": "String",
      "metadata": {
        "displayName": "Effect",
        "description": "Enable or disable the execution of the policy"
      },
      "allowedValues": [
        "Audit",
        "Disabled"
      ],
      "defaultValue": "Audit"
    },
    "pipExcludeRgNames": {
      "type": "Array",
      "metadata": {
        "displayName": "Resource group names to be allowed for Public IP's (PIP)"
      }
    }
  }
  EOT

policy_list = {
  ####### Start Deny Public Access
  "1cf164be-6819-4a50-b8fa-4bcaa4f98fb6" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1cf164be-6819-4a50-b8fa-4bcaa4f98fb6"
    name = "Public network access on Azure Data Factory should be disabled"
  }
  "1b8ca024-1d5c-4dec-8995-b1a932b41780" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1b8ca024-1d5c-4dec-8995-b1a932b41780"
    name = "Public network access on Azure SQL Database should be disabled"
  }
  "e372f825-a257-4fb8-9175-797a8a8627d6" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/e372f825-a257-4fb8-9175-797a8a8627d6"
    name = "RDP access from the Internet should be blocked"
    parameters = <<-EOT
    {
      "effect": {"value": "[parameters('effect')]"}
    }
    EOT
  }
  "2c89a2e5-7285-40fe-afe0-ae8654b92fab" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2c89a2e5-7285-40fe-afe0-ae8654b92fab"
    name = "SSH access from the Internet should be blocked"
    parameters = <<-EOT
    {
      "effect": {"value": "[parameters('effect')]"}
    }
    EOT
  }
  ####### Start Compute resources
  "cccc23c7-8427-4f53-ad12-b6a63eb452b3" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3"
    name = "Allowed virtual machine size SKUs"
    parameters = <<-EOT
    {
      "listOfAllowedSKUs": {"value": "[parameters('listOfAllowedVMSKUs')]"}
    }
    EOT
  }
  "06a78e20-9358-41c9-923c-fb736d382a4d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"
    name = "Audit VMs that do not use managed disks"
  }
  "c0e996f8-39cf-4af9-9f45-83fbde810432" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/c0e996f8-39cf-4af9-9f45-83fbde810432"
    name = "Only approved VM extensions should be installed"
    parameters = <<-EOT
    {
      "approvedExtensions": {"value": "[parameters('approvedExtensions')]"}
    }
    EOT
  }
  "2c89a2e5-7285-40fe-afe0-ae8654b92fb2" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2c89a2e5-7285-40fe-afe0-ae8654b92fb2"
    name = "Unattached disks should be encrypted"
  }
  "1d84d5fb-01f6-4d12-ba4f-4a26081d403d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1d84d5fb-01f6-4d12-ba4f-4a26081d403d"
    name = "Virtual machines should be migrated to new Azure Resource Manager resources"
  }
  ####### End Compute resources
  ####### Start Storage resources
  "7433c107-6db4-4ad1-b57a-a76dce0154a1" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/7433c107-6db4-4ad1-b57a-a76dce0154a1"
    name = "Allowed storage account SKUs"
    parameters = <<-EOT
    {
      "listOfAllowedSKUs": {"value": "[parameters('listOfAllowedSASKUs')]"}
    }
    EOT
  }
  "308fbb08-4ab8-4e67-9b29-592e93fb94fa" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/308fbb08-4ab8-4e67-9b29-592e93fb94fa"
    name = "Azure Defender for Storage should be enabled"
  }
  "404c3081-a854-4457-ae30-26a93ef643f9" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9"
    name = "Secure transfer to storage accounts should be enabled"
  }
  "6edd7eda-6dd8-40f7-810d-67160c639cd9" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/6edd7eda-6dd8-40f7-810d-67160c639cd9"
    name = "Storage account should use a private link connection"
  }
  "c9d007d0-c057-4772-b18c-01e546713bcd" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/c9d007d0-c057-4772-b18c-01e546713bcd"
    name = "Storage accounts should allow access from trusted Microsoft services"
  }
  "37e0d2fe-28a5-43d6-a273-67d37d1f5606" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/37e0d2fe-28a5-43d6-a273-67d37d1f5606"
    name = "Storage accounts should be migrated to new Azure Resource Manager resources"
  }
  "34c877ad-507e-4c82-993e-3452a6e0ad3c" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/34c877ad-507e-4c82-993e-3452a6e0ad3c"
    name = "Storage accounts should restrict network access"
  }
  "2a1a9cdf-e04d-429a-8416-3bfb72a1b26f" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2a1a9cdf-e04d-429a-8416-3bfb72a1b26f"
    name = "Storage accounts should restrict network access using virtual network rules"
  }
  "6fac406b-40ca-413b-bf8e-0bf964659c25" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/6fac406b-40ca-413b-bf8e-0bf964659c25"
    name = "Storage accounts should use customer-managed key (CMK) for encryption"
  }
  ####### End Storage resources
  ####### Start Network resources
  "e71308d3-144b-4262-b144-efdc3cc90517" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/e71308d3-144b-4262-b144-efdc3cc90517"
    name = "Subnets should be associated with a Network Security Group"
  }
  ####### End Network resourcesf
  ####### Start App Service resources
  "c4ebc54a-46e1-481a-bee2-d4411e95d828" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/c4ebc54a-46e1-481a-bee2-d4411e95d828"
    name = "Authentication should be enabled on your API App"
  }
  "95bccee9-a7f8-4bec-9ee9-62c3473701fc" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/95bccee9-a7f8-4bec-9ee9-62c3473701fc"
    name = "Authentication should be enabled on your web App"
  }
  "358c20a6-3f9e-4f0e-97ff-c6ce485e2aac" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/358c20a6-3f9e-4f0e-97ff-c6ce485e2aac"
    name = "CORS should not allow every resource to access your API App"
  }
  "6d555dd1-86f2-4f1c-8ed7-5abae7c6cbab" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/6d555dd1-86f2-4f1c-8ed7-5abae7c6cbab"
    name = "Function App should only be accessible over HTTPS"
  }
  "a4af4a39-4135-47fb-b175-47fbdf85311d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/a4af4a39-4135-47fb-b175-47fbdf85311d"
    name = "Web Application should only be accessible over HTTPS"
  }
  "8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e"
    name = "Latest TLS version should be used in your API App"
  }
  "f9d614c5-c173-4d56-95a7-b4437057d193" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/f9d614c5-c173-4d56-95a7-b4437057d193"
    name = "Latest TLS version should be used in your Function App"
  }
  "f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b"
    name = "Latest TLS version should be used in your Web App"
  }

  ####### End App Service resources
  ####### Start Audit Built In Policies List
  "324c7761-08db-4474-9661-d1039abc92ee" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/324c7761-08db-4474-9661-d1039abc92ee"
    name = "API apps should use an Azure file share for its content directory"
  }
  "3d9f5e4c-9947-4579-9539-2a7695fbc187" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/3d9f5e4c-9947-4579-9539-2a7695fbc187"
    name = "App Configuration should disable public network access"
  }
  "967a4b4b-2da9-43c1-b7d0-f98d0d74d0b1" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/967a4b4b-2da9-43c1-b7d0-f98d0d74d0b1"
    name = "App Configuration should use a customer-managed key"
  }
  "89c8a434-18f0-402c-8147-630a8dea54e0" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/89c8a434-18f0-402c-8147-630a8dea54e0"
    name = "App Configuration should use a SKU that supports private link"
  }
  "9db7917b-1607-4e7d-a689-bca978dd0633" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/9db7917b-1607-4e7d-a689-bca978dd0633"
    name = "Application definition for Managed Application should use customer provided storage account"
  }
  "a451c1ef-c6ca-483d-87ed-f49761e3ffb5" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/a451c1ef-c6ca-483d-87ed-f49761e3ffb5"
    name = "Audit usage of custom RBAC rules"
  }
  "955a914f-bf86-4f0e-acd5-e0766b0efcb6" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/955a914f-bf86-4f0e-acd5-e0766b0efcb6"
    name = "Automation accounts should disable public network access"
  }
  "56a5ee18-2ae6-4810-86f7-18e39ce5629b" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/56a5ee18-2ae6-4810-86f7-18e39ce5629b"
    name = "Azure Automation accounts should use customer-managed keys to encrypt data at rest"
  }
  "99e9ccd8-3db9-4592-b0d1-14b1715a4d8a" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/99e9ccd8-3db9-4592-b0d1-14b1715a4d8a"
    name = "Azure Batch account should use customer-managed keys to encrypt data"
  }
  "470baccb-7e51-4549-8b1a-3e5be069f663" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/470baccb-7e51-4549-8b1a-3e5be069f663"
    name = "Azure Cache for Redis should disable public network access"
  }
  "a049bf77-880b-470f-ba6d-9f21c530cf83" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/a049bf77-880b-470f-ba6d-9f21c530cf83"
    name = "Azure Cognitive Search service should use a SKU that supports private link"
  }
  "8af8f826-edcb-4178-b35f-851ea6fea615" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/8af8f826-edcb-4178-b35f-851ea6fea615"
    name = "Azure Container Instance container group should deploy into a virtual network"
  }
  "0aa61e00-0a01-4a3c-9945-e93cffedf0e6" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0aa61e00-0a01-4a3c-9945-e93cffedf0e6"
    name = "Azure Container Instance container group should use customer-managed key for encryption"
  }
  "81e74cea-30fd-40d5-802f-d72103c2aaaa" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/81e74cea-30fd-40d5-802f-d72103c2aaaa"
    name = "Azure Data Explorer encryption at rest should use a customer-managed key"
  }
  "1adadefe-5f21-44f7-b931-a59b54ccdb45" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1adadefe-5f21-44f7-b931-a59b54ccdb45"
    name = "Azure Event Grid topics should disable public network access"
  }
  "4b90e17e-8448-49db-875e-bd83fb6f804f" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/4b90e17e-8448-49db-875e-bd83fb6f804f"
    name = "Azure Event Grid topics should use private link"
  }
  "64d314f6-6062-4780-a861-c23e8951bee5" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/64d314f6-6062-4780-a861-c23e8951bee5"
    name = "Azure HDInsight clusters should use customer-managed keys to encrypt data at rest"
  }
  "1fd32ebd-e4c3-4e13-a54a-d7422d4d95f6" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1fd32ebd-e4c3-4e13-a54a-d7422d4d95f6"
    name = "Azure HDInsight clusters should use encryption at host to encrypt data at rest"
  }
  "040732e8-d947-40b8-95d6-854c95024bf8" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/040732e8-d947-40b8-95d6-854c95024bf8"
    name = "Azure Kubernetes Service Private Clusters should be enabled"
  }
  "21a9766a-82a5-4747-abb5-650b6dbba6d0" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/21a9766a-82a5-4747-abb5-650b6dbba6d0"
    name = "Azure SignalR Service should disable public network access"
  }
  "464a1620-21b5-448d-8ce6-d4ac6d1bc49a" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/464a1620-21b5-448d-8ce6-d4ac6d1bc49a"
    name = "Azure SignalR Service should use a Private Link enabled SKU"
  }
  "53503636-bcc9-4748-9663-5348217f160f" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/53503636-bcc9-4748-9663-5348217f160f"
    name = "Azure SignalR Service should use private link"
  }
  "2bdd0062-9d75-436e-89df-487dd8e4b3c7" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2bdd0062-9d75-436e-89df-487dd8e4b3c7"
    name = "Cognitive Services accounts should enable data encryption"
  }
  "67121cc7-ff39-4ab8-b7e3-95b84dab487d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/67121cc7-ff39-4ab8-b7e3-95b84dab487d"
    name = "Cognitive Services accounts should enable data encryption with a customer-managed key (CMK)"
  }
  "46aa9b05-0e60-4eae-a88b-1e9d374fa515" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/46aa9b05-0e60-4eae-a88b-1e9d374fa515"
    name = "Cognitive Services accounts should use customer owned storage"
  }
  "11566b39-f7f7-4b82-ab06-68d8700eb0a4" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/11566b39-f7f7-4b82-ab06-68d8700eb0a4"
    name = "Cognitive Services accounts should use customer owned storage or enable data encryption."
  }
  "5b9159ae-1701-4a6f-9a7a-aa9c8ddd0580" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/5b9159ae-1701-4a6f-9a7a-aa9c8ddd0580"
    name = "Container registries should be encrypted with a customer-managed key (CMK)"
  }
  "10ee2ea2-fb4d-45b8-a7e9-a2e770044cd9" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/10ee2ea2-fb4d-45b8-a7e9-a2e770044cd9"
    name = "Custom subscription owner roles should not exist"
  }
  "0c192fe8-9cbb-4516-85b3-0ade8bd03886" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0c192fe8-9cbb-4516-85b3-0ade8bd03886"
    name = "Ensure API app has 'Client Certificates (Incoming client certificates)' set to 'On'"
  }
  "5bb220d9-2698-4ee4-8404-b9c30c9df609" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/5bb220d9-2698-4ee4-8404-b9c30c9df609"
    name = "Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'"
  }
  "27960feb-a23c-4577-8d36-ef8b5f35e0be" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/27960feb-a23c-4577-8d36-ef8b5f35e0be"
    name = "Flow logs should be enabled for every network security group"
  }
  "4d0bc837-6eff-477e-9ecd-33bf8d4212a5" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/4d0bc837-6eff-477e-9ecd-33bf8d4212a5"
    name = "Function apps should use an Azure file share for its content directory"
  }
  "56fd377d-098c-4f02-8406-81eb055902b8" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/56fd377d-098c-4f02-8406-81eb055902b8"
    name = "IP firewall rules on Azure Synapse workspaces should be removed"
  }
  "2d9dbfa3-927b-4cf0-9d0f-08747f971650" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2d9dbfa3-927b-4cf0-9d0f-08747f971650"
    name = "Managed workspace virtual network on Azure Synapse workspaces should be enabled"
  }
  "702dd420-7fcc-42c5-afe8-4026edd20fe0" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/702dd420-7fcc-42c5-afe8-4026edd20fe0"
    name = "OS and data disks should be encrypted with a customer-managed key"
  }
  "7698e800-9299-47a6-b3b6-5a0fee576eed" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/7698e800-9299-47a6-b3b6-5a0fee576eed"
    name = "Private endpoint connections on Azure SQL Database should be enabled"
  }
  "2d6830fb-07eb-48e7-8c4d-2a442b35f0fb" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2d6830fb-07eb-48e7-8c4d-2a442b35f0fb"
    name = "Public network access on Azure IoT Hub should be disabled"
  }
  "21a8cd35-125e-4d13-b82d-2e19b7208bb7" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/21a8cd35-125e-4d13-b82d-2e19b7208bb7"
    name = "Public network access should be disabled for Azure File Sync"
  }
  "74c5a0ae-5e48-4738-b093-65e23a060488" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/74c5a0ae-5e48-4738-b093-65e23a060488"
    name = "Public network access should be disabled for Batch accounts"
  }
  "0725b4dd-7e76-479c-a735-68e7ee23d5ca" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0725b4dd-7e76-479c-a735-68e7ee23d5ca"
    name = "Public network access should be disabled for Cognitive Services accounts"
  }
  "a1181c5f-672a-477a-979a-7d58aa086233" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/a1181c5f-672a-477a-979a-7d58aa086233"
    name = "Security Center standard pricing tier should be selected"
  }
  "295fc8b1-dc9f-4f53-9c61-3f313ceab40a" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/295fc8b1-dc9f-4f53-9c61-3f313ceab40a"
    name = "Service Bus Premium namespaces should use a customer-managed key for encryption"
  }
  "04c655fe-0ac7-48ae-9a32-3a2e208c7624" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/04c655fe-0ac7-48ae-9a32-3a2e208c7624"
    name = "Shared dashboards should not have markdown tiles with inline content"
  }
  "0088bc63-6dee-4a9c-9d29-91cfdc848952" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0088bc63-6dee-4a9c-9d29-91cfdc848952"
    name = "SQL Server Integration Services integration runtimes on Azure Data Factory should be joined to a virtual network"
  }
  "4733ea7b-a883-42fe-8cac-97454c2a9e4a" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/4733ea7b-a883-42fe-8cac-97454c2a9e4a"
    name = "Storage accounts should have infrastructure encryption"
  }
  "3a003702-13d2-4679-941b-937e58c443f0" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/3a003702-13d2-4679-941b-937e58c443f0"
    name = "Synapse managed private endpoints should only connect to resources in approved Azure Active Directory tenants"
  }
  "41425d9f-d1a5-499a-9932-f8ed8453932c" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/41425d9f-d1a5-499a-9932-f8ed8453932c"
    name = "Temp disks and cache for agent node pools in Azure Kubernetes Service clusters should be encrypted at host"
  }
  "9ad2fd1f-b25f-47a2-aa01-1a5a779e6413" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/9ad2fd1f-b25f-47a2-aa01-1a5a779e6413"
    name = "Virtual network injection should be enabled for Azure Data Explorer"
  }
  "564feb30-bf6a-4854-b4bb-0d2d2d1e6c66" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/564feb30-bf6a-4854-b4bb-0d2d2d1e6c66"
    name = "Web Application Firewall (WAF) should be enabled for Application Gateway"
  }
  "055aa869-bc98-4af8-bafc-23f1ab6ffe2c" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/055aa869-bc98-4af8-bafc-23f1ab6ffe2c"
    name = "Web Application Firewall (WAF) should be enabled for Azure Front Door Service service"
  }
  "12430be1-6cc8-4527-a9a8-e3d38f250096" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/12430be1-6cc8-4527-a9a8-e3d38f250096"
    name = "Web Application Firewall (WAF) should use the specified mode for Application Gateway"
  }
  "425bea59-a659-4cbb-8d31-34499bd030b8" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/425bea59-a659-4cbb-8d31-34499bd030b8"
    name = "Web Application Firewall (WAF) should use the specified mode for Azure Front Door Service"
  }

  ####### End Audit Built In Policies
  ####### Start AuditifNotExist Built In Policies
    "47a6b606-51aa-4496-8bb7-64b11cf66adc" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/47a6b606-51aa-4496-8bb7-64b11cf66adc"
    name = "Adaptive application controls for defining safe applications should be enabled on your machines"
  }
    "9daedab3-fb2d-461e-b861-71790eead4f6" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/9daedab3-fb2d-461e-b861-71790eead4f6"
    name = "All network ports should be restricted on network security groups associated to your virtual machine"
  }
    "123a3936-f020-408a-ba0c-47873faf1534" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/123a3936-f020-408a-ba0c-47873faf1534"
    name = "Allowlist rules in your adaptive application control policy should be updated"
  }
    "2d21331d-a4c2-4def-a9ad-ee4e1e023beb" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2d21331d-a4c2-4def-a9ad-ee4e1e023beb"
    name = "App Service should use a virtual network service endpoint"
  }
    "475aae12-b88a-4572-8b36-9b712b2b3a17" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/475aae12-b88a-4572-8b36-9b712b2b3a17"
    name = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
  }
    "013e242c-8828-4970-87b3-ab247555486d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/013e242c-8828-4970-87b3-ab247555486d"
    name = "Azure Backup should be enabled for Virtual Machines"
  }
    "a7aca53f-2ed4-4466-a25e-0b45ade68efd" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/a7aca53f-2ed4-4466-a25e-0b45ade68efd"
    name = "Azure DDoS Protection Standard should be enabled"
  }
    "4da35fc9-c9e7-4960-aec9-797fe7d9051d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/4da35fc9-c9e7-4960-aec9-797fe7d9051d"
    name = "Azure Defender for servers should be enabled"
  }
    "1a4e592a-6a6e-44a5-9814-e36264ca96e7" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1a4e592a-6a6e-44a5-9814-e36264ca96e7"
    name = "Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'"
  }
    "41388f1c-2db0-4c25-95b2-35d7f5ccbfa9" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/41388f1c-2db0-4c25-95b2-35d7f5ccbfa9"
    name = "Azure Monitor should collect activity logs from all regions"
  }
    "3e596b57-105f-48a6-be97-03e9243bad6e" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/3e596b57-105f-48a6-be97-03e9243bad6e"
    name = "Azure Monitor solution 'Security and Audit' must be deployed"
  }
    "1c06e275-d63d-4540-b761-71f364c2111d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1c06e275-d63d-4540-b761-71f364c2111d"
    name = "Azure Service Bus namespaces should use private link"
  }
    "7796937f-307b-4598-941c-67d3a05ebfe7" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/7796937f-307b-4598-941c-67d3a05ebfe7"
    name = "Azure subscriptions should have a log profile for Activity Log"
  }
    "5345bb39-67dc-4960-a1bf-427e16b9a0bd" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/5345bb39-67dc-4960-a1bf-427e16b9a0bd"
    name = "Connection throttling should be enabled for PostgreSQL database servers"
  }
    "0820b7b9-23aa-4725-a1ce-ae4558f718e5" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0820b7b9-23aa-4725-a1ce-ae4558f718e5"
    name = "CORS should not allow every resource to access your Function Apps"
  }
    "0961003e-5a0a-4549-abde-af6a37f2724d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0961003e-5a0a-4549-abde-af6a37f2724d"
    name = "Disk encryption should be applied on virtual machines"
  }
    "6e2593d9-add6-4083-9c9b-4b7d2188c899" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/6e2593d9-add6-4083-9c9b-4b7d2188c899"
    name = "Email notification for high severity alerts should be enabled"
  }
    "0b15565f-aa9e-48ba-8619-45960f2c314d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0b15565f-aa9e-48ba-8619-45960f2c314d"
    name = "Email notification to subscription owner for high severity alerts should be enabled"
  }
    "991310cd-e9f3-47bc-b7b6-f57b557d07db" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/991310cd-e9f3-47bc-b7b6-f57b557d07db"
    name = "Ensure that 'HTTP Version' is the latest, if used to run the API app"
  }
    "8c122334-9d20-4eb8-89ea-ac9a705b74ae" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/8c122334-9d20-4eb8-89ea-ac9a705b74ae"
    name = "Ensure that 'HTTP Version' is the latest, if used to run the Web app"
  }
    "88999f4c-376a-45c8-bcb3-4058f713cf39" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/88999f4c-376a-45c8-bcb3-4058f713cf39"
    name = "Ensure that 'Java version' is the latest, if used as a part of the API app"
  }
    "9d0b6ea4-93e2-4578-bf2f-6bb17d22b4bc" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/9d0b6ea4-93e2-4578-bf2f-6bb17d22b4bc"
    name = "Ensure that 'Java version' is the latest, if used as a part of the Function app"
  }
    "496223c3-ad65-4ecd-878a-bae78737e9ed" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/496223c3-ad65-4ecd-878a-bae78737e9ed"
    name = "Ensure that 'Java version' is the latest, if used as a part of the Web app"
  }
    "1bc1795e-d44a-4d48-9b3b-6fff0fd5f9ba" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1bc1795e-d44a-4d48-9b3b-6fff0fd5f9ba"
    name = "Ensure that 'PHP version' is the latest, if used as a part of the API app"
  }
    "7261b898-8a84-4db8-9e04-18527132abb3" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/7261b898-8a84-4db8-9e04-18527132abb3"
    name = "Ensure that 'PHP version' is the latest, if used as a part of the WEB app"
  }
    "74c3584d-afae-46f7-a20a-6f8adba71a16" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/74c3584d-afae-46f7-a20a-6f8adba71a16"
    name = "Ensure that 'Python version' is the latest, if used as a part of the API app"
  }
    "7238174a-fd10-4ef0-817e-fc820a951d73" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/7238174a-fd10-4ef0-817e-fc820a951d73"
    name = "Ensure that 'Python version' is the latest, if used as a part of the Function app"
  }
    "7008174a-fd10-4ef0-817e-fc820a951d73" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/7008174a-fd10-4ef0-817e-fc820a951d73"
    name = "Ensure that 'Python version' is the latest, if used as a part of the Web app"
  }
    "9a1b8c48-453a-4044-86c3-d8bfd823e4f5" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/9a1b8c48-453a-4044-86c3-d8bfd823e4f5"
    name = "FTPS only should be required in your API App"
  }
    "399b2637-a50f-4f95-96f8-3a145476eb15" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/399b2637-a50f-4f95-96f8-3a145476eb15"
    name = "FTPS only should be required in your Function App"
  }
    "4d24b6d4-5e53-4a4f-a7f4-618fa573ee4b" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/4d24b6d4-5e53-4a4f-a7f4-618fa573ee4b"
    name = "FTPS should be required in your Web App"
  }
    "5c3bc7b8-a64c-4e08-a9cd-7ff0f31e1138" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/5c3bc7b8-a64c-4e08-a9cd-7ff0f31e1138"
    name = "Audit Log Analytics agent deployment in virtual machine scale sets - VM Image (OS) unlisted"
  }
    "a4fe33eb-e377-4efb-ab31-0784311bc499" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/a4fe33eb-e377-4efb-ab31-0784311bc499"
    name = "Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring"
  }
    "a3a6ea0c-e018-4933-9ef0-5aaa1501449b" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/a3a6ea0c-e018-4933-9ef0-5aaa1501449b"
    name = "Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring"
  }
    "0da106f2-4ca3-48e8-bc85-c638fe6aea8f" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0da106f2-4ca3-48e8-bc85-c638fe6aea8f"
    name = "Managed identity should be used in your Function App"
  }
    "2b9ad585-36bc-4615-b300-fd4435808332" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/2b9ad585-36bc-4615-b300-fd4435808332"
    name = "Managed identity should be used in your Web App"
  }
    "22730e10-96f6-4aac-ad84-9383d35b5917" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/22730e10-96f6-4aac-ad84-9383d35b5917"
    name = "Management ports should be closed on your virtual machines"
  }
    "9b597639-28e4-48eb-b506-56b05d366257" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/9b597639-28e4-48eb-b506-56b05d366257"
    name = "Microsoft IaaSAntimalware extension should be deployed on Windows servers"
  }
    "5a913c68-0590-402c-a531-e57e19379da3" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/5a913c68-0590-402c-a531-e57e19379da3"
    name = "Operating system version should be the most current version for your cloud service roles"
  }
    "3c14b034-bcb6-4905-94e7-5b8e98a47b65" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/3c14b034-bcb6-4905-94e7-5b8e98a47b65"
    name = "PostgreSQL server should use a virtual network service endpoint"
  }
    "0c2b3618-68a8-4034-a150-ff4abc873462" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0c2b3618-68a8-4034-a150-ff4abc873462"
    name = "Private endpoint connections on Automation Accounts should be enabled"
  }
    "009a0c92-f5b4-4776-9b66-4ed2b4775563" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/009a0c92-f5b4-4776-9b66-4ed2b4775563"
    name = "Private endpoint connections on Batch accounts should be enabled"
  }
    "91a78b24-f231-4a8a-8da9-02c35b2b6510" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/91a78b24-f231-4a8a-8da9-02c35b2b6510"
    name = "Resource logs in App Services should be enabled"
  }
    "057ef27e-665e-4328-8ea3-04b3122bd9fb" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/057ef27e-665e-4328-8ea3-04b3122bd9fb"
    name = "Diagnostic logs in Azure Data Lake Store should be enabled"
  }
    "428256e6-1fac-4f48-a757-df34c2b3336d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/428256e6-1fac-4f48-a757-df34c2b3336d"
    name = "Diagnostic logs in Batch accounts should be enabled"
  }
    "34f95f76-5386-4de7-b824-0d8478470c9d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/34f95f76-5386-4de7-b824-0d8478470c9d"
    name = "Diagnostic logs in Logic Apps should be enabled"
  }
    "7c1b1214-f927-48bf-8882-84f0af6588b1" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/7c1b1214-f927-48bf-8882-84f0af6588b1"
    name = "Diagnostic logs in Virtual Machine Scale Sets should be enabled"
  }
    "235359c5-7c52-4b82-9055-01c75cf9f60e" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/235359c5-7c52-4b82-9055-01c75cf9f60e"
    name = "Service Bus should use a virtual network service endpoint"
  }
    "6646a0bd-e110-40ca-bb97-84fcee63c414" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/6646a0bd-e110-40ca-bb97-84fcee63c414"
    name = "Service principals should be used to protect your subscriptions instead of management certificates"
  }
    "7ff426e2-515f-405a-91c8-4f2333442eb5" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/7ff426e2-515f-405a-91c8-4f2333442eb5"
    name = "SQL Auditing settings should have Action-Groups configured to capture critical activities"
  }
    "048248b0-55cd-46da-b1ff-39efd52db260" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/048248b0-55cd-46da-b1ff-39efd52db260"
    name = "SQL managed instances should use customer-managed keys to encrypt data at rest"
  }
    "89099bee-89e0-4b26-a5f4-165451757743" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/89099bee-89e0-4b26-a5f4-165451757743"
    name = "SQL servers should be configured with 90 days auditing retention or higher."
  }
    "0d134df8-db83-46fb-ad72-fe0c9428c8dd" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0d134df8-db83-46fb-ad72-fe0c9428c8dd"
    name = "SQL servers should use customer-managed keys to encrypt data at rest"
  }
    "4f4f78b8-e367-4b10-a341-d9a4ad5cf1c7" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/4f4f78b8-e367-4b10-a341-d9a4ad5cf1c7"
    name = "Subscriptions should have a contact email address for security issues"
  }
    "529ea018-6afc-4ed4-95bd-7c9ee47b00bc" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/529ea018-6afc-4ed4-95bd-7c9ee47b00bc"
    name = "Synapse workspaces with SQL auditing to storage account destination should be configured with 90 days retention or higher"
  }
    "86b3d65f-7626-441e-b690-81a8b71cff60" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/86b3d65f-7626-441e-b690-81a8b71cff60"
    name = "System updates should be installed on your machines"
  }
    "a70ca396-0a34-413a-88e1-b956c1e683be" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/a70ca396-0a34-413a-88e1-b956c1e683be"
    name = "The Log Analytics agent should be installed on virtual machines"
  }
    "17k78e20-9358-41c9-923c-fb736d382a12" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/17k78e20-9358-41c9-923c-fb736d382a12"
    name = "Transparent Data Encryption on SQL databases should be enabled"
  }
    "3c735d8a-a4ba-4a3a-b7cf-db7754cf57f4" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/3c735d8a-a4ba-4a3a-b7cf-db7754cf57f4"
    name = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
  }
    "6ba6d016-e7c3-4842-b8f2-4992ebc0d72d" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/6ba6d016-e7c3-4842-b8f2-4992ebc0d72d"
    name = "Vulnerabilities on your SQL servers on machine should be remediated"
  }
    "057d6cfe-9c4f-4a6d-bc60-14420ea1f1a9" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/057d6cfe-9c4f-4a6d-bc60-14420ea1f1a9"
    name = "Vulnerability Assessment settings for SQL server should contain an email address to receive scan reports"
  }
    "1b7aa243-30e4-4c9e-bca8-d0d3022b634a" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/1b7aa243-30e4-4c9e-bca8-d0d3022b634a"
    name = "Vulnerability assessment should be enabled on SQL Managed Instance"
  }
    "0049a6b3-a662-4f3e-8635-39cf44ace45a" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/0049a6b3-a662-4f3e-8635-39cf44ace45a"
    name = "Vulnerability assessment should be enabled on your Synapse workspaces"
  }
####### End AuditifNotExist Built In Policies
####### Start Allowed Resources types to Deploy in Environment
  "a08ec900-254a-4555-9bf5-e42af04b5c5c" = {
    id = "/providers/Microsoft.Authorization/policyDefinitions/a08ec900-254a-4555-9bf5-e42af04b5c5c",
    name = "Allowed resource types"
    parameters = <<-EOT
    {
      "listOfResourceTypesAllowed": {"value": "[parameters('listOfResourceTypesAllowed')]"}
    }
    EOT
  }
}

policy_def_list = {
  "Deny Anonymous Access - Storage Account" = {
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Storage",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/sa-deny-public-access.json"
    parameters_path = ""
    parameter_values = {}
  },
  "Deny Public IP - NIC Association with Resource Group exception" = {
    mode = "All"
    metadata = <<METADATA
    {
      "category": "Network",
      "version" : "1.0.0"
    }
    METADATA
    rule_path = "custom_policies/deny-pip-rg-exclusion.json"
    parameters_path = "custom_policies/piprg.parameters.json"
    parameter_values = {
      pipExcludeRgNames = "[parameters('pipExcludeRgNames')]"
    }
  }
}
