param (
    [Parameter(Mandatory = $true)]
    [string[]]
    $ResourceIdList,

    [Parameter(Mandatory = $false)]
    [string]
    $WorkspaceId = '0650461d-93bc-470b-b1db-f7bbdd5ffc08'
)

Describe 'Monitoring Policy Diagnostic Settings' -Tag "DIAG" {

    Context "Should add Diagnostics Setting for Storage Account" {

        BeforeDiscovery {

            $diagSettingsVAList = @()
            $diagSettingsTXList = @()
            $nsgFlowLogVAList = @()
            $nsgFlowLogTXList = @()
            $diagSettingsMissing = @()

            <# 
            Diagnostic settings are not enabled for both Virtual Machines and SQL servers.
            Its diagnostic settings can be enabled only with storage accounts and does not support Log Analytic Workspaces.
            VM's logs will be collected with DCR which is tested below.
            #> 
            $excludedDiagSettingResources = @(
            '*Microsoft.Compute/virtualMachines/eitaaslinuxvmva', 
            '*Microsoft.Compute/virtualMachines/eitaaslinuxvmtx',
            '*Microsoft.Compute/virtualMachines/eitaastswinvmva',
            '*Microsoft.Compute/virtualMachines/eitaastswinvmtx',
            '*Microsoft.Compute/virtualMachines/custimgubunvmva',
            '*Microsoft.Compute/virtualMachines/custimgubunvmtx',
            '*Microsoft.Compute/virtualMachines/custimgwinvmva',
            '*Microsoft.Compute/virtualMachines/custimgwinvmtx',
            '*Microsoft.Compute/virtualMachines/custimgrhelvmva',
            '*Microsoft.Compute/virtualMachines/custimgrhelvmtx',
            '*Microsoft.Sql/servers/eitaastestvasqlserver',
            '*Microsoft.Sql/servers/eitaastesttxsqlserver')

            $txResources = @(
                '*-tx',
                '*eitaastesttx',
                '*eitaastesttxsqlserver'
                '*synapseworkspacetx'
                '*eitaastesttxmysql'
            )

            foreach ($resource in $ResourceIdList)
            {
                Write-Host "Retrieving SA diagnostic settings for $resource"
                $diagSettingExists = Get-AzDiagnosticSetting -Name 'eitaas-monitoring-policy' -ResourceId $resource -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
                $networkWatchers = Get-AzNetworkWatcher -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
                foreach ($networkWatcher in $networkWatchers)
                {
                 $nsgFlowLogExists = Get-AzNetworkwatcherFlowLog -NetworkWatcher $networkWatcher | where-object { $_.TargetResourceId -eq $resource } -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
                }
                if ($diagSettingExists)
                {
                    Write-Host "Diagnostic settings exist for $resource"
                    if (($txResources | ForEach-Object {$resource -like $_}) -notcontains $true)
                    {
                        $diagSettingsVAList += @{
                            ResourceId    = $resource
                            DiagSettingSA = $diagSettingExists.StorageAccountId
                            DiagSettingLA = $diagSettingExists.WorkspaceId
                        }
                    } else {
                        $diagSettingsTXList += @{
                            ResourceId    = $resource
                            DiagSettingSA = $diagSettingExists.StorageAccountId
                            DiagSettingLA = $diagSettingExists.WorkspaceId
                        }
                    }
                }
                elseif (($excludedDiagSettingResources | ForEach-Object {$resource -like $_}) -notcontains $true)
                {
                    Write-Host "Diagnostic settings MISSING for $resource"
                    $diagSettingsMissing += @{
                        ResourceId = $resource
                    }
                }
                elseif ($nsgFlowLogExists)
                {
                    Write-Host "Flow Log exist for $resource"
                    if (($txResources | ForEach-Object {$resource -like $_}) -notcontains $true)
                    {
                        $nsgFlowLogVAList += @{
                            ResourceId = $resource
                            FlowLogSA  = $nsgFlowLogExists.StorageId
                        }
                    } else {
                        $nsgFlowLogTXList += @{
                            ResourceId = $resource
                            FlowLogSA  = $nsgFlowLogExists.StorageId
                        }
                    }
                }
            }
        }

        BeforeAll {
            $vaDiagSettingsSAResourceId = (Get-AzResource -Name 'dvaeitaascdecoremon' -ResourceType Microsoft.Storage/storageAccounts).ResourceId
            $txDiagSettingsSAResourceId = (Get-AzResource -Name 'dtxeitaascdecoremon' -ResourceType Microsoft.Storage/storageAccounts).ResourceId
        }

        It 'Should have returned diagnostic settings for all resources' -ForEach $diagSettingsMissing {

            $ResourceId | Should -Be $null
        }

        It "<ResourceId> diagnostic settings are set for VA resources" -ForEach $diagSettingsVAList {
            $DiagSettingSA | should -Be $vaDiagSettingsSAResourceId
        }

        It "<ResourceId> diagnostic settings are set for TX resources" -ForEach $diagSettingsTXList {
            $DiagSettingSA | should -Be $txDiagSettingsSAResourceId
        }

        It "<ResourceId> flow logs are set for VA resources" -ForEach $nsgFlowLogVAList {
            $FlowLogSA | should -Be $vaDiagSettingsSAResourceId
        }

        It "<ResourceId> flow logs are set for TX resources" -ForEach $nsgFlowLogTXList {
            $FlowLogSA | should -Be $txDiagSettingsSAResourceId
        }

    }

    Context 'Should return all policies are compliant on the test Resource Group' {

        BeforeDiscovery {

            $policyComplianceList = @()
            foreach ($resource in $resourceIdList)
            {
                $policyComplianceList += (az policy state list --resource $resource | ConvertFrom-Json -AsHashtable)
            }

            $nonCompliantPolicyList = $policyComplianceList.Where({ $_.policyAssignmentName -eq 'EITaaS_Monitoring' -and $_.complianceState -eq 'NonCompliant' })
        }

        It 'Returns all Resource Group Policy as compliant' -ForEach $nonCompliantPolicyList {

            $resourceId | Should -Be $null
        }
    }
}

Describe 'Monitoring Policy KQL and DCR Settings' -Tag 'AMA' {

    Context 'Should add AMA and send logs to LAW' {

        BeforeDiscovery {
            $vmList = $resourceIdList.Where({ $_ -like '*Microsoft.Compute/virtualMachines*'})
            
            $resultsList = @()
            foreach ($vm in $vmList)
            {
                $vmName = ($vm -split '/')[-1]

                $result = @{
                    VmName = $vmName
                    QueryResult = ''
                    dcrSecVmName = ''
                    dcrOpVmName = ''
                }

            $query = "Heartbeat
                    | where TimeGenerated > ago(5m)
                    | where Computer == `'$($vmName)`'
                    | where Category contains 'Azure Monitor Agent'
                    | summarize arg_max(Computer, Category, ResourceGroup, Solutions) by SourceComputerId
                    | project Computer, Category, ResourceGroup, Solutions"

            $kqlQuery = Invoke-AzOperationalInsightsQuery -WorkspaceId $WorkspaceId -Query $query

            $result.QueryResult = $kqlQuery.Results.Computer

            $DCEResult = Get-AzDataCollectionRuleAssociation -TargetResourceId $vm
            
            $dcrSecList = $DCEResult.where({ $_.Name -like 'assoc-*'-and $_.DataCollectionRuleId -like '*-Security'})
            $dcrOpList = $DCEResult.where({ $_.Name -like 'assoc-*'-and $_.DataCollectionRuleId -like '*-Operational'})

            $result.dcrSecVmName = ($dcrSecList.id -split '/')[8]
            $result.dcrOpVmName = ($dcrOpList.id -split '/')[8]
            # [-1] returns DCE/DCR association name instead of VM name

            $resultsList += $result
            $result = $null
            }
        }

        It "VM <VmName>'s AMA queried from LAW" -ForEach $resultsList {

            $QueryResult | Should -Be $VmName
        }

        It "VM <VmName>'s Security DCR found" -ForEach $resultsList {

            $dcrSecVmName | Should -Be $VmName
        }

        It "VM <VmName>'s Operational DCR found" -ForEach $resultsList {

            $dcrSecVmName | Should -Be $VmName
        }

    }
}

