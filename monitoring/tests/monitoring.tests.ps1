param (
    [Parameter(Mandatory = $true)]
    [hashtable[]]
    $ResourceIdList
)

Describe 'Testing policy diagnostic settings with Storage Account' -Tag "diag-monitoring-sa" {

    Context "Should add diagnostics setting pointing to the SA" -Tag "enable-diagnosticsetting-monitoring-sa-10" {

        BeforeDiscovery {

            $diagSettingsList = @()
            foreach ($resource in $ResourceIdList)
            {
                Write-Host $resource.ResourceId
                $diagSettingExists = Get-AzDiagnosticSetting -Name 'setByPolicySA' -ResourceId $resource.ResourceId -ErrorAction SilentlyContinue
                if ($diagSettingExists)
                {
                    Write-Host "diag settings exist for $($resource.ResourceId)"
                    $diagSettingsList += @{
                        ResourceId  = $resource.ResourceId
                        DiagSetting = $diagSettingExists.StorageAccountId
                    }
                }
            }
        }

        BeforeAll {
            $diagSettingsSAName = "svaContosocdecoremon"
            $diagSettingsSAResourceId = (Get-AzResource -Name $diagSettingsSAName -ResourceType Microsoft.Storage/storageAccounts).ResourceId
        }

        It "<ResourceId> diagnostic settings are set" -ForEach $diagSettingsList {
            $DiagSetting | should -Be $diagSettingsSAResourceId
        }
    }

    Context 'Should add diagnostic setting pointing to the LA' -Tag "enable-diagnosticsetting-monitoring-la-10" {
        
        BeforeDiscovery {

            $diagSettingsList = @()
            foreach ($resource in $ResourceIdList)
            {
                Write-Host $resource.ResourceId
                $diagSettingExists = Get-AzDiagnosticSetting -Name 'setByPolicyLA' -ResourceId $resource.ResourceId -ErrorAction SilentlyContinue
                if ($diagSettingExists)
                {
                    Write-Host "diag settings exist for $($resource.ResourceId)"
                    $diagSettingsList += @{
                        ResourceId  = $resource.ResourceId
                        DiagSetting = $diagSettingExists.WorkspaceId
                    }
                }
            }
        }

        BeforeAll {
            $diagSettingsLAName = "svaContosocdecore"
            $diagSettingsLAResourceId = (Get-AzResource -Name $diagSettingsLAName -ResourceType Microsoft.OperationalInsights/workspaces).ResourceId
        }

        It "<ResourceId> diagnostic settings are set" -ForEach $diagSettingsList {
            $DiagSetting | should -be $diagSettingsLAResourceId
        }
    }
}
