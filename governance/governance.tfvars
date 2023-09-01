policy_set_name       = "EITaaS_Governance"
policy_type           = "Custom"
policy_mode           = "All"
policy_description    = "Eitaas Governance policy for settings not directly related to accreditation."
policy_set_parameters = <<-EOT
  {
    "listOfAllowedLocations": {
      "type": "Array",
      "metadata": {
        "description": "The list of locations that can be specified when deploying resources.",
        "strongType": "location",
        "displayName": "Allowed locations"
      },
      "defaultValue": ["usgovvirginia", "usgovtexas", "usgovarizona"]
    },
    "listOfAllowedVMSKUs": {
      "type": "Array",
      "metadata": {
        "description": "The list of size SKUs that can be specified for virtual machines.",
        "displayName": "Allowed Size SKUs",
        "strongType": "VMSKUs"
      },
      "defaultValue": [
        "Standard_D16ds_v4",
        "Standard_D16ds_v5",
        "Standard_D16s_v3",
        "Standard_D16s_v5",
        "Standard_D2s_v3",
        "Standard_D2s_v5",
        "Standard_D2ds_v5",
        "Standard_D4ds_v4",
        "Standard_D4ds_v5",
        "Standard_D4s_v3",
        "Standard_D4s_v5",
        "Standard_D8ds_v4",
        "Standard_D8ds_v5",
        "Standard_D8s_v3",
        "Standard_D8s_v5",
        "Standard_DS12_v2",
        "Standard_DS12-2_v2",
        "Standard_DS3_v2",
        "Standard_E4ds_v5",
        "Standard_F4s_v2",
        "Standard_F8s_v2"
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
        "Microsoft.AAD/DomainServices",
        "Microsoft.AAD/DomainServices/oucontainer",
        "Microsoft.AAD/locations",
        "Microsoft.AAD/locations/operationresults",
        "Microsoft.AAD/operations",
        "Microsoft.AlertsManagement/actionRules",
        "Microsoft.AlertsManagement/smartDetectorAlertRules",
        "Microsoft.ApiManagement",
        "Microsoft.ApiManagement/service",
        "Microsoft.AppConfiguration/configurationStores",
        "Microsoft.Authorization/locks",
        "Microsoft.Automation/automationAccounts",
        "Microsoft.Automation/automationAccounts/runbooks",
        "Microsoft.Automation/automationAccounts/configurations",
        "microsoft.botservice/botservices",
        "Microsoft.Cdn/profiles",
        "Microsoft.Cdn/profiles/endpoints",
        "Microsoft.Cdn/profiles/endpoints/origins",
        "Microsoft.Cdn/profiles/endpoints/origingroups",
        "Microsoft.Cdn/profiles/endpoints/customdomains",
        "Microsoft.Cdn/operationresults",
        "Microsoft.Cdn/operationresults/profileresults",
        "Microsoft.Cdn/operationresults/profileresults/endpointresults",
        "Microsoft.Cdn/operationresults/profileresults/endpointresults/originresults",
        "Microsoft.Cdn/operationresults/profileresults/endpointresults/origingroupresults",
        "Microsoft.Cdn/operationresults/profileresults/endpointresults/customdomainresults",
        "Microsoft.Cdn/checkNameAvailability",
        "Microsoft.Cdn/checkResourceUsage",
        "Microsoft.Cdn/validateProbe",
        "Microsoft.Cdn/operations",
        "Microsoft.Cdn/edgenodes",
        "Microsoft.Cdn/CdnWebApplicationFirewallPolicies",
        "Microsoft.Cdn/CdnWebApplicationFirewallManagedRuleSets",
        "Microsoft.Cdn/profiles/afdendpoints",
        "Microsoft.Cdn/profiles/afdendpoints/routes",
        "Microsoft.Cdn/profiles/customdomains",
        "Microsoft.Cdn/profiles/origingroups",
        "Microsoft.Cdn/profiles/origingroups/origins",
        "Microsoft.Cdn/profiles/rulesets",
        "Microsoft.Cdn/profiles/rulesets/rules",
        "Microsoft.Cdn/profiles/secrets",
        "Microsoft.Cdn/profiles/securitypolicies",
        "Microsoft.Cdn/operationresults/profileresults/afdendpointresults",
        "Microsoft.Cdn/operationresults/profileresults/afdendpointresults/routeresults",
        "Microsoft.Cdn/operationresults/profileresults/customdomainresults",
        "Microsoft.Cdn/operationresults/profileresults/origingroupresults",
        "Microsoft.Cdn/operationresults/profileresults/origingroupresults/originresults",
        "Microsoft.Cdn/operationresults/profileresults/rulesetresults",
        "Microsoft.Cdn/operationresults/profileresults/rulesetresults/ruleresults",
        "Microsoft.Cdn/operationresults/profileresults/secretresults",
        "Microsoft.Cdn/operationresults/profileresults/securitypoliciesresults",
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
        "Microsoft.Compute/proximityPlacementGroups",
        "Microsoft.Compute/restorePointCollections",
        "Microsoft.Compute/snapshots",
        "Microsoft.Compute/virtualMachines",
        "Microsoft.Compute/virtualMachines/extensions",
        "Microsoft.Compute/virtualMachineScaleSets",
        "Microsoft.Compute/virtualMachineScaleSets/applications",
        "Microsoft.Compute/virtualMachineScaleSets/extensions",
        "Microsoft.Compute/virtualMachineScaleSets/networkInterfaces",
        "Microsoft.Compute/virtualMachineScaleSets/publicIPAddresses",
        "Microsoft.Compute/virtualMachineScaleSets/virtualMachines",
        "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/extensions",
        "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/networkInterfaces",
        "Microsoft.ContainerInstance/containerGroups",
        "Microsoft.ContainerInstance/locations",
        "Microsoft.ContainerInstance/locations/cachedImages",
        "Microsoft.ContainerInstance/locations/capabilities",
        "Microsoft.ContainerInstance/locations/deleteVirtualNetworkOrSubnets",
        "Microsoft.ContainerInstance/locations/operationresults",
        "Microsoft.ContainerInstance/locations/operations",
        "Microsoft.ContainerInstance/locations/usages",
        "Microsoft.ContainerInstance/operations",
        "Microsoft.ContainerInstance/serviceAssociationLinks",
        "Microsoft.Databricks/workspaces",
        "Microsoft.DataFactory/factories",
        "Microsoft.DataProtection/BackupVaults",
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
        "Microsoft.DesktopVirtualization/applicationGroups",
        "Microsoft.DesktopVirtualization/hostPools",
        "Microsoft.DesktopVirtualization/workspaces",
        "Microsoft.DevTestLab/labs",
        "Microsoft.DevTestLab/labs/environments",
        "Microsoft.DevTestLab/schedules",
        "microsoft.documentdb/databaseaccounts",
        "Microsoft.EventGrid/systemTopics",
        "Microsoft.EventGrid/eventSubscriptions",
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
        "Microsoft.Insights/actiongroups",
        "Microsoft.Insights/autoscalesettings",
        "Microsoft.Insights/activityLogAlerts",
        "Microsoft.Insights/components",
        "Microsoft.Insights/dataCollectionEndpoints",
        "Microsoft.Insights/dataCollectionEndpoints/scopedPrivateLinkProxies",
        "Microsoft.Insights/dataCollectionRules",
        "Microsoft.Insights/metricalerts",
        "Microsoft.Insights/privatelinkscopes",
        "Microsoft.Insights/scheduledqueryrules",
        "Microsoft.Insights/webtests",
        "Microsoft.Insights/workbooks",
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
        "Microsoft.MachineLearningServices/workspaces",
        "Microsoft.ManagedIdentity/userAssignedIdentities",
        "Microsoft.Migrate/assessmentProjects",
        "Microsoft.Migrate/locations",
        "Microsoft.Migrate/locations/assessmentOptions",
        "Microsoft.Migrate/locations/checkNameAvailability",
        "Microsoft.Migrate/locations/rmsOperationResults",
        "Microsoft.Migrate/migrateprojects",
        "Microsoft.Migrate/moveCollections",
        "Microsoft.Migrate/operations",
        "Microsoft.Migrate/projects",
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
        "Microsoft.Network/azurefirewalls",
        "microsoft.network/firewallpolicies",
        "Microsoft.Network/loadBalancers",
        "Microsoft.Network/natGateways",
        "Microsoft.Network/networkInterfaces",
        "Microsoft.Network/networkManagers",
        "Microsoft.Network/networkManagerConnections",
        "Microsoft.Network/networkSecurityGroups",
        "Microsoft.Network/networkWatchers",
        "Microsoft.Network/networkWatchers/connectionMonitors",
        "Microsoft.Network/networkWatchers/flowLogs",
        "Microsoft.Network/privateDnsZones",
        "Microsoft.Network/privateDnsZones/virtualNetworkLinks",
        "Microsoft.Network/privateEndpoints",
        "Microsoft.Network/privateLinkServices",
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
        "Microsoft.Portal/dashboards",
        "Microsoft.Portal/dashboards/write",
        "Microsoft.RecoveryServices/vaults",
        "Microsoft.Resources/deployments",
        "Microsoft.Resources/checkPolicyCompliance",
        "microsoft.search/searchservices",
        "Microsoft.ServiceBus",
        "Microsoft.ServiceBus/namespaces",
        "Microsoft.ServiceBus/namespaces/AuthorizationRules",
        "Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs",
        "Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs/AuthorizationRules",
        "Microsoft.ServiceBus/namespaces/migrationConfigurations",
        "Microsoft.ServiceBus/namespaces/ipfilterrules",
        "Microsoft.ServiceBus/namespaces/networkRuleSets",
        "Microsoft.ServiceBus/namespaces/privateEndpointConnections",
        "Microsoft.ServiceBus/namespaces/queues",
        "Microsoft.ServiceBus/namespaces/queues/authorizationRules",
        "Microsoft.ServiceBus/namespaces/topics",
        "Microsoft.ServiceBus/namespaces/topics/authorizationRules",
        "Microsoft.ServiceBus/namespaces/topics/subscriptions",
        "Microsoft.ServiceBus/namespaces/topics/subscriptions/rules",
        "Microsoft.ServiceBus/namespaces/virtualnetworkrules",
        "Microsoft.Sql/servers",
        "Microsoft.Sql/servers/databases",
        "Microsoft.Sql/servers/elasticpools",
        "Microsoft.SqlVirtualMachine/SqlVirtualMachines",
        "Microsoft.Storage/storageAccounts",
        "Microsoft.StreamAnalytics",
        "Microsoft.StreamAnalytics/streamingjobs",
        "Microsoft.Synapse/workspaces",
        "Microsoft.Synapse/workspaces/bigDataPools",
        "Microsoft.Synapse/workspaces/sqlPools",
        "Microsoft.Web/certificates",
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
        "AzureMonitorWindowsAgent",
        "AzureMonitorLinuxAgent",
        "BGInfo",
        "CustomScript",
        "CustomScriptExtension",
        "DependencyAgentLinux",
        "DependencyAgentWindows",
        "DSC",
        "DSCForLinux",
        "enablevmaccess",
        "IaaSDiagnostics",
        "JsonADDomainExtension",
        "MDE.Windows",
        "MicrosoftMonitoringAgent",
        "NetworkWatcherAgentLinux",
        "NetworkWatcherAgentWindows",
        "OmsAgentForLinux",
        "VMAccessAgent"
      ]
    },
    "listOfAllowedSASKUs": {
      "type": "Array",
      "metadata": {
        "description": "The list of SKUs that can be specified for storage accounts.",
        "displayName": "Allowed SKUs",
        "strongType": "StorageSKUs"
      },
      "defaultValue": [ "Standard_GRS", "Standard_RAGRS", "Standard_GZRS", "Standard_RAGZRS", "Premium_LRS", "Standard_LRS" ]
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
    "pipExcludeRgIds": {
      "type": "Array",
      "metadata": {
        "displayName": "Resource group Ids to be allowed for Public IP's (PIP)"
      }
    },
    "blobExcludeRgIds": {
      "type": "Array",
      "metadata": {
        "displayName": "Resource group Ids to be allowed for Public Storage Account"
      }
    },
    "subnetExcludeNames": {
      "type": "Array",
      "metadata": {
        "displayName": "Subnet names to be excluded from audit policy. These subnets do not need route tables."
      }
    },
    "subnetExcludeRgNames": {
      "type": "Array",
      "metadata": {
          "displayName": "Resource groups to be excluded from audit policy. These subnets do not need route tables."
      }
    },
    "vmBackupExcludeRgIds": {
      "type": "Array",
      "metadata": {
          "displayName": "List of resource group IDs to exclude from VM backup policy."
      }
    }
  }
  EOT

policy_list = {
  ####### Start Compute resources
  "cccc23c7-8427-4f53-ad12-b6a63eb452b3" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3"
    name        = "Allowed virtual machine size SKUs"
    parameters  = <<-EOT
    {
      "listOfAllowedSKUs": {"value": "[parameters('listOfAllowedVMSKUs')]"}
    }
    EOT
  }
  "06a78e20-9358-41c9-923c-fb736d382a4d" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"
    name        = "Audit VMs that do not use managed disks"
  }
  "c0e996f8-39cf-4af9-9f45-83fbde810432" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/c0e996f8-39cf-4af9-9f45-83fbde810432"
    name        = "Only approved VM extensions should be installed"
    parameters  = <<-EOT
    {
      "approvedExtensions": {"value": "[parameters('approvedExtensions')]"}
    }
    EOT
  }
  "1d84d5fb-01f6-4d12-ba4f-4a26081d403d" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/1d84d5fb-01f6-4d12-ba4f-4a26081d403d"
    name        = "Virtual machines should be migrated to new Azure Resource Manager resources"
  }
  ####### End Compute resources

  ####### Start Storage resources
  "7433c107-6db4-4ad1-b57a-a76dce0154a1" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/7433c107-6db4-4ad1-b57a-a76dce0154a1"
    name        = "Allowed storage account SKUs"
    parameters  = <<-EOT
    {
      "listOfAllowedSKUs": {"value": "[parameters('listOfAllowedSASKUs')]"}
    }
    EOT
  }
  "404c3081-a854-4457-ae30-26a93ef643f9" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9"
    name        = "Secure transfer to storage accounts should be enabled"
  }
  "c9d007d0-c057-4772-b18c-01e546713bcd" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/c9d007d0-c057-4772-b18c-01e546713bcd"
    name        = "Storage accounts should allow access from trusted Microsoft services"
  }
  "37e0d2fe-28a5-43d6-a273-67d37d1f5606" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/37e0d2fe-28a5-43d6-a273-67d37d1f5606"
    name        = "Storage accounts should be migrated to new Azure Resource Manager resources"
  }
  ####### End Storage resources

  ####### Start Network resources
  "e71308d3-144b-4262-b144-efdc3cc90517" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/e71308d3-144b-4262-b144-efdc3cc90517"
    name        = "Subnets should be associated with a Network Security Group"
  }
  ####### End Network resourcesf

  ####### Start App Service resources
  "95bccee9-a7f8-4bec-9ee9-62c3473701fc" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/95bccee9-a7f8-4bec-9ee9-62c3473701fc"
    name        = "App Service apps should have authentication enabled"
  }
  "6d555dd1-86f2-4f1c-8ed7-5abae7c6cbab" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/6d555dd1-86f2-4f1c-8ed7-5abae7c6cbab"
    name        = "Function App should only be accessible over HTTPS"
  }
  "a4af4a39-4135-47fb-b175-47fbdf85311d" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/a4af4a39-4135-47fb-b175-47fbdf85311d"
    name        = "App Service apps should only be accessible over HTTPS"
  }
  "f9d614c5-c173-4d56-95a7-b4437057d193" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/f9d614c5-c173-4d56-95a7-b4437057d193"
    name        = "Latest TLS version should be used in your Function App"
  }
  "f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b"
    name        = "App Service apps should use the latest TLS version"
  }
  ####### End App Service resources

  ####### Start Audit Built In Policies List
  "dcbc65aa-59f3-4239-8978-3bb869d82604" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/dcbc65aa-59f3-4239-8978-3bb869d82604"
    name        = "App Service apps should use an Azure file share for its content directory"
  }
  "8af8f826-edcb-4178-b35f-851ea6fea615" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/8af8f826-edcb-4178-b35f-851ea6fea615"
    name        = "Azure Container Instance container group should deploy into a virtual network"
  }
  "1fd32ebd-e4c3-4e13-a54a-d7422d4d95f6" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/1fd32ebd-e4c3-4e13-a54a-d7422d4d95f6"
    name        = "Azure HDInsight clusters should use encryption at host to encrypt data at rest"
  }
  "040732e8-d947-40b8-95d6-854c95024bf8" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/040732e8-d947-40b8-95d6-854c95024bf8"
    name        = "Azure Kubernetes Service Private Clusters should be enabled"
  }
  "5bb220d9-2698-4ee4-8404-b9c30c9df609" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/5bb220d9-2698-4ee4-8404-b9c30c9df609"
    name        = "App Service apps should have 'Client Certificates (Incoming client certificates)' enabled"
  }
  "27960feb-a23c-4577-8d36-ef8b5f35e0be" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/27960feb-a23c-4577-8d36-ef8b5f35e0be"
    name        = "Flow logs should be enabled for every network security group"
  }
  "4d0bc837-6eff-477e-9ecd-33bf8d4212a5" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/4d0bc837-6eff-477e-9ecd-33bf8d4212a5"
    name        = "Function apps should use an Azure file share for its content directory"
  }
  "2d9dbfa3-927b-4cf0-9d0f-08747f971650" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/2d9dbfa3-927b-4cf0-9d0f-08747f971650"
    name        = "Managed workspace virtual network on Azure Synapse workspaces should be enabled"
  }
  "04c655fe-0ac7-48ae-9a32-3a2e208c7624" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/04c655fe-0ac7-48ae-9a32-3a2e208c7624"
    name        = "Shared dashboards should not have markdown tiles with inline content"
  }
  "0088bc63-6dee-4a9c-9d29-91cfdc848952" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/0088bc63-6dee-4a9c-9d29-91cfdc848952"
    name        = "SQL Server Integration Services integration runtimes on Azure Data Factory should be joined to a virtual network"
  }
  "41425d9f-d1a5-499a-9932-f8ed8453932c" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/41425d9f-d1a5-499a-9932-f8ed8453932c"
    name        = "Temp disks and cache for agent node pools in Azure Kubernetes Service clusters should be encrypted at host"
  }
  "9ad2fd1f-b25f-47a2-aa01-1a5a779e6413" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/9ad2fd1f-b25f-47a2-aa01-1a5a779e6413"
    name        = "Virtual network injection should be enabled for Azure Data Explorer"
  }
  "564feb30-bf6a-4854-b4bb-0d2d2d1e6c66" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/564feb30-bf6a-4854-b4bb-0d2d2d1e6c66"
    name        = "Web Application Firewall (WAF) should be enabled for Application Gateway"
  }
  "055aa869-bc98-4af8-bafc-23f1ab6ffe2c" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/055aa869-bc98-4af8-bafc-23f1ab6ffe2c"
    name        = "Web Application Firewall (WAF) should be enabled for Azure Front Door Service service"
  }
  "12430be1-6cc8-4527-a9a8-e3d38f250096" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/12430be1-6cc8-4527-a9a8-e3d38f250096"
    name        = "Web Application Firewall (WAF) should use the specified mode for Application Gateway"
  }
  "425bea59-a659-4cbb-8d31-34499bd030b8" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/425bea59-a659-4cbb-8d31-34499bd030b8"
    name        = "Web Application Firewall (WAF) should use the specified mode for Azure Front Door Service"
  }
  ####### End Audit Built In Policies

  ####### Start AuditifNotExist Built In Policies
  "47a6b606-51aa-4496-8bb7-64b11cf66adc" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/47a6b606-51aa-4496-8bb7-64b11cf66adc"
    name        = "Adaptive application controls for defining safe applications should be enabled on your machines"
  }
  "9daedab3-fb2d-461e-b861-71790eead4f6" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/9daedab3-fb2d-461e-b861-71790eead4f6"
    name        = "All network ports should be restricted on network security groups associated to your virtual machine"
  }
  "123a3936-f020-408a-ba0c-47873faf1534" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/123a3936-f020-408a-ba0c-47873faf1534"
    name        = "Allowlist rules in your adaptive application control policy should be updated"
  }
  "2d21331d-a4c2-4def-a9ad-ee4e1e023beb" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/2d21331d-a4c2-4def-a9ad-ee4e1e023beb"
    name        = "App Service should use a virtual network service endpoint"
  }
  "5345bb39-67dc-4960-a1bf-427e16b9a0bd" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/5345bb39-67dc-4960-a1bf-427e16b9a0bd"
    name        = "Connection throttling should be enabled for PostgreSQL database servers"
  }
  "0820b7b9-23aa-4725-a1ce-ae4558f718e5" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/0820b7b9-23aa-4725-a1ce-ae4558f718e5"
    name        = "CORS should not allow every resource to access your Function Apps"
  }
  "6e2593d9-add6-4083-9c9b-4b7d2188c899" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/6e2593d9-add6-4083-9c9b-4b7d2188c899"
    name        = "Email notification for high severity alerts should be enabled"
  }
  "0b15565f-aa9e-48ba-8619-45960f2c314d" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/0b15565f-aa9e-48ba-8619-45960f2c314d"
    name        = "Email notification to subscription owner for high severity alerts should be enabled"
  }
  "8c122334-9d20-4eb8-89ea-ac9a705b74ae" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/8c122334-9d20-4eb8-89ea-ac9a705b74ae"
    name        = "App Service apps should use latest 'HTTP Version"
  }
  "9d0b6ea4-93e2-4578-bf2f-6bb17d22b4bc" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/9d0b6ea4-93e2-4578-bf2f-6bb17d22b4bc"
    name        = "Ensure that 'Java version' is the latest, if used as a part of the Function app"
  }
  "496223c3-ad65-4ecd-878a-bae78737e9ed" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/496223c3-ad65-4ecd-878a-bae78737e9ed"
    name        = "App Service apps that use Java should use a specified 'Java version'"
  }
  "7261b898-8a84-4db8-9e04-18527132abb3" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/7261b898-8a84-4db8-9e04-18527132abb3"
    name        = "App Service apps that use PHP should use a specified 'PHP version'"
  }
  "7238174a-fd10-4ef0-817e-fc820a951d73" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/7238174a-fd10-4ef0-817e-fc820a951d73"
    name        = "Ensure that 'Python version' is the latest, if used as a part of the Function app"
  }
  "7008174a-fd10-4ef0-817e-fc820a951d73" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/7008174a-fd10-4ef0-817e-fc820a951d73"
    name        = "App Service apps that use Python should use a specified 'Python version'"
  }
  "399b2637-a50f-4f95-96f8-3a145476eb15" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/399b2637-a50f-4f95-96f8-3a145476eb15"
    name        = "FTPS only should be required in your Function App"
  }
  "4d24b6d4-5e53-4a4f-a7f4-618fa573ee4b" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/4d24b6d4-5e53-4a4f-a7f4-618fa573ee4b"
    name        = "App Service apps should require FTPS only"
  }
  "5c3bc7b8-a64c-4e08-a9cd-7ff0f31e1138" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/5c3bc7b8-a64c-4e08-a9cd-7ff0f31e1138"
    name        = "Audit Log Analytics agent deployment in virtual machine scale sets - VM Image (OS) unlisted"
  }
  "0da106f2-4ca3-48e8-bc85-c638fe6aea8f" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/0da106f2-4ca3-48e8-bc85-c638fe6aea8f"
    name        = "Managed identity should be used in your Function App"
  }
  "2b9ad585-36bc-4615-b300-fd4435808332" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/2b9ad585-36bc-4615-b300-fd4435808332"
    name        = "Managed identity should be used in your Web App"
  }
  "22730e10-96f6-4aac-ad84-9383d35b5917" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/22730e10-96f6-4aac-ad84-9383d35b5917"
    name        = "Management ports should be closed on your virtual machines"
  }
  "3c14b034-bcb6-4905-94e7-5b8e98a47b65" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/3c14b034-bcb6-4905-94e7-5b8e98a47b65"
    name        = "PostgreSQL server should use a virtual network service endpoint"
  }
  "91a78b24-f231-4a8a-8da9-02c35b2b6510" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/91a78b24-f231-4a8a-8da9-02c35b2b6510"
    name        = "Resource logs in App Services should be enabled"
  }
  "057ef27e-665e-4328-8ea3-04b3122bd9fb" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/057ef27e-665e-4328-8ea3-04b3122bd9fb"
    name        = "Diagnostic logs in Azure Data Lake Store should be enabled"
  }
  "428256e6-1fac-4f48-a757-df34c2b3336d" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/428256e6-1fac-4f48-a757-df34c2b3336d"
    name        = "Diagnostic logs in Batch accounts should be enabled"
  }
  "34f95f76-5386-4de7-b824-0d8478470c9d" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/34f95f76-5386-4de7-b824-0d8478470c9d"
    name        = "Diagnostic logs in Logic Apps should be enabled"
  }
  "a3a6ea0c-e018-4933-9ef0-5aaa1501449b" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/a3a6ea0c-e018-4933-9ef0-5aaa1501449b"
    name        = "Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring"
  }
  "7ff426e2-515f-405a-91c8-4f2333442eb5" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/7ff426e2-515f-405a-91c8-4f2333442eb5"
    name        = "SQL Auditing settings should have Action-Groups configured to capture critical activities"
  }
  "89099bee-89e0-4b26-a5f4-165451757743" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/89099bee-89e0-4b26-a5f4-165451757743"
    name        = "SQL servers should be configured with 90 days auditing retention or higher."
  }
  "529ea018-6afc-4ed4-95bd-7c9ee47b00bc" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/529ea018-6afc-4ed4-95bd-7c9ee47b00bc"
    name        = "Synapse workspaces with SQL auditing to storage account destination should be configured with 90 days retention or higher"
  }
  "86b3d65f-7626-441e-b690-81a8b71cff60" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/86b3d65f-7626-441e-b690-81a8b71cff60"
    name        = "System updates should be installed on your machines"
  }
  "17k78e20-9358-41c9-923c-fb736d382a12" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/17k78e20-9358-41c9-923c-fb736d382a12"
    name        = "Transparent Data Encryption on SQL databases should be enabled"
  }
  "3c735d8a-a4ba-4a3a-b7cf-db7754cf57f4" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/3c735d8a-a4ba-4a3a-b7cf-db7754cf57f4"
    name        = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
  }
  "1b7aa243-30e4-4c9e-bca8-d0d3022b634a" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/1b7aa243-30e4-4c9e-bca8-d0d3022b634a"
    name        = "Vulnerability assessment should be enabled on SQL Managed Instance"
  }
  ####### End AuditifNotExist Built In Policies

  ####### Start Allowed Resources types to Deploy in Environment
  "a08ec900-254a-4555-9bf5-e42af04b5c5c" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/a08ec900-254a-4555-9bf5-e42af04b5c5c",
    name        = "Allowed resource types"
    parameters  = <<-EOT
    {
      "listOfResourceTypesAllowed": {"value": "[parameters('listOfResourceTypesAllowed')]"}
    }
    EOT
  }
  ####### End Allowed Resources types to Deploy in Environment

  ####### Start Custom Policy Lists
  "Deny Anonymous Access - Storage Account" = {
    mode            = "All"
    policy_type     = "Custom"
    metadata        = <<METADATA
    {
      "category": "Storage",
      "version" : "1.0.0"
    }
    METADATA
    rule_path       = "custom_policies/sa-deny-public-access.json"
    parameters_path = "custom_policies/blobrg.parameters.json"
    parameters      = <<-EOT
    {
      "blobExcludeRgIds": {"value": "[parameters('blobExcludeRgIds')]"}
    }
    EOT
  }
  "Deny Public IP - NIC Association with Resource Group exception" = {
    mode            = "All"
    policy_type     = "Custom"
    metadata        = <<METADATA
    {
      "category": "Network",
      "version" : "1.0.0"
    }
    METADATA
    rule_path       = "custom_policies/deny-pip-rg-exclusion.json"
    parameters_path = "custom_policies/piprg.parameters.json"
    parameters      = <<-EOT
    {
      "pipExcludeRgIds": {"value": "[parameters('pipExcludeRgIds')]"}
    }
    EOT
  }
  "OS and data disks should be encrypted-disk only" = {
    mode            = "All"
    policy_type     = "Custom"
    metadata        = <<METADATA
    {
      "category": "Compute",
      "version" : "1.0.0"
    }
    METADATA
    rule_path       = "custom_policies/os-and-data-disk-encryption.json"
    parameters_path = "custom_policies/os-and-data-disk-encryption.parameters.json"
    parameters      = <<-EOT
    {
      "effect": {"value": "[parameters('effect')]"}
    }
    EOT
  }
  "Audit what subnets do not have a route table" = {
    mode            = "All"
    policy_type     = "Custom"
    metadata        = <<METADATA
    {
      "category": "Network",
      "version" : "1.0.0"
    }
    METADATA
    rule_path       = "custom_policies/audit-subnet-no-route-table.json"
    parameters_path = "custom_policies/audit-subnet-no-route-table.parameters.json"
    parameters      = <<-EOT
    {
      "subnetExcludeNames": {"value": "[parameters('subnetExcludeNames')]"},
      "subnetExcludeRgNames": {"value": "[parameters('subnetExcludeRgNames')]"}
    }
    EOT
  }
  "Azure Backup should be enabled for Virtual Machines" = {
    mode            = "All"
    policy_type     = "Custom"
    metadata        = <<METADATA
    {
      "category": "Backup",
      "version" : "3.0.0"
    }
    METADATA
    rule_path       = "custom_policies/vm-backup-enabled.json"
    parameters_path = "custom_policies/vm-backup-enabled.parameters.json"
    parameters      = <<-EOT
    {
      "vmBackupExcludeRgIds": {"value": "[parameters('vmBackupExcludeRgIds')]"}
    }
    EOT
  }
  ####### End Custom Policy Lists

  ####### Start ORCA Controls
  "e765b5de-1225-4ba3-bd56-1ac6695af988" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/e765b5de-1225-4ba3-bd56-1ac6695af988"
    name        = "Allowed locations for resource groups"
    parameters  = <<-EOT
    {
      "listOfAllowedLocations": {"value": "[parameters('listOfAllowedLocations')]"}
    }
    EOT
  }
  "e56962a6-4747-49cd-b67b-bf8b01975c4c" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
    name        = "Allowed locations"
    parameters  = <<-EOT
    {
      "listOfAllowedLocations": {"value": "[parameters('listOfAllowedLocations')]"}
    }
    EOT
  }
  "4f11b553-d42e-4e3a-89be-32ca364cad4c" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/4f11b553-d42e-4e3a-89be-32ca364cad4c"
    name        = "A maximum of 3 owners should be designated for your subscription"
  }
  "0cfea604-3201-4e14-88fc-fae4c427a6c5" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/0cfea604-3201-4e14-88fc-fae4c427a6c5"
    name        = "Blocked accounts with owner permissions on Azure resources should be removed"
  }
  "339353f6-2387-4a45-abe4-7f529d121046" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/339353f6-2387-4a45-abe4-7f529d121046"
    name        = "Guest accounts with owner permissions on Azure resources should be removed"
  }
  "94e1c2ac-cbbe-4cac-a2b5-389c812dee87" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/94e1c2ac-cbbe-4cac-a2b5-389c812dee87"
    name        = "Guest accounts with write permissions on Azure resources should be removed"
  }
  "e9ac8f8e-ce22-4355-8f04-99b911d6be52" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/e9ac8f8e-ce22-4355-8f04-99b911d6be52"
    name        = "Guest accounts with read permissions on Azure resources should be removed"
  }
  "931e118d-50a1-4457-a5e4-78550e086c52" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/931e118d-50a1-4457-a5e4-78550e086c52"
    name        = "Accounts with write permissions on Azure resources should be MFA enabled"
  }
  "e3e008c3-56b9-4133-8fd7-d3347377402a" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/e3e008c3-56b9-4133-8fd7-d3347377402a"
    name        = "Accounts with owner permissions on Azure resources should be MFA enabled"
  }
  "81b3ccb4-e6e8-4e4a-8d05-5df25cd29fd4" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/81b3ccb4-e6e8-4e4a-8d05-5df25cd29fd4"
    name        = "Accounts with read permissions on Azure resources should be MFA enabled"
  }
  "f6de0be7-9a8a-4b8a-b349-43cf02d22f7c" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/f6de0be7-9a8a-4b8a-b349-43cf02d22f7c"
    name        = "Internet-facing virtual machines should be protected with network security groups"
  }
  "5744710e-cc2f-4ee8-8809-3b11e89f4bc9" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/5744710e-cc2f-4ee8-8809-3b11e89f4bc9"
    name        = "App Service apps should not have CORS configured to allow every resource to access your apps"
  }
  "cb510bfd-1cba-4d9f-a230-cb0976f4bb71" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/cb510bfd-1cba-4d9f-a230-cb0976f4bb71"
    name        = "App Service apps should have remote debugging turned off"
  }
  "0e60b895-3786-45da-8377-9c6b4b6ac5f9" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/0e60b895-3786-45da-8377-9c6b4b6ac5f9"
    name        = "Remote debugging should be turned off for Function Apps"
  }
  "d38fc420-0735-4ef3-ac11-c806f651a570" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/d38fc420-0735-4ef3-ac11-c806f651a570"
    name        = "Long-term geo-redundant backup should be enabled for Azure SQL Databases"
  }
  "0ec47710-77ff-4a3d-9181-6aa50af424d0" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/0ec47710-77ff-4a3d-9181-6aa50af424d0"
    name        = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
  }
  "48af4db5-9b8b-401c-8e74-076be876a430" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/48af4db5-9b8b-401c-8e74-076be876a430"
    name        = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
  }
  "abfb7388-5bf4-4ad7-ba99-2cd2f41cebb9" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/abfb7388-5bf4-4ad7-ba99-2cd2f41cebb9"
    name        = "Advanced data security should be enabled on SQL Managed Instance"
  }
  "a6fb4358-5bf4-4ad7-ba82-2cd2f41ce5e9" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/a6fb4358-5bf4-4ad7-ba82-2cd2f41ce5e9"
    name        = "Auditing on SQL server should be enabled"
  }
  "0b60c0b2-2dc2-4e1c-b5c9-abbed971de53" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/0b60c0b2-2dc2-4e1c-b5c9-abbed971de53"
    name        = "Key vault should have purge protection enabled"
  }
  "1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d"
    name        = "Key vault should have soft delete enabled"
  }
  "bf045164-79ba-4215-8f95-f8048dc1780b" = {
    policy_type = "BuiltIn"
    id          = "/providers/Microsoft.Authorization/policyDefinitions/bf045164-79ba-4215-8f95-f8048dc1780b"
    name        = "Geo-redundant storage should be enabled for Storage Accounts"
  }
  ####### End ORCA Controls
}
