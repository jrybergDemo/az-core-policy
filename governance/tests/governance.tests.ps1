[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]
    $PolicyScope
)

Describe "Governance Policy Set Definition" {

    BeforeAll {
        [string]$tfJson = Get-Content -Path (Join-Path -Path (Split-Path -Path $PSScriptRoot) -ChildPath "output.json") -Raw
        $expectedPolicySet = (ConvertFrom-Json -InputObject $tfJson -AsHashTable).policy_list.value
    
        $expectedpolicySetParameters = $expectedPolicySet.parameters | ConvertFrom-Json -AsHashtable
    
        $azJson = az policy set-definition show -n Contoso_Governance --management-group $PolicyScope
        $actualPolicySet = $azJson | ConvertFrom-Json
    }
    
    Context "When policy is deployed" {

        It "Deploys all desired custom policy" {

            $customPolicyListExpected = ($expectedPolicySet.policy_definition_reference.Where({ $_.policy_group_names -contains 'custom' })).policy_definition_id
            $customPolicyListExpected | Should -Not -BeNullOrEmpty

            $customPolicyListActual = ($actualPolicySet.PolicyDefinitions.Where({ $_.groupNames -contains 'custom' })).policyDefinitionId
            $customPolicyListActual | Should -Not -BeNullOrEmpty

            $comparison = Compare-Object -ReferenceObject $customPolicyListExpected -DifferenceObject $customPolicyListActual
            $comparison | Should -BeNullOrEmpty
        }

        It "Deploys all desired builtin policy" {

            $builtinPolicyListExpected = ($expectedPolicySet.policy_definition_reference.Where({ [string]::IsNullOrEmpty($_.policy_group_names) })).policy_definition_id
            $builtinPolicyListExpected | Should -Not -BeNullOrEmpty

            $builtinPolicyListActual = ($actualPolicySet.PolicyDefinitions.Where({ [string]::IsNullOrEmpty($_.groupNames) })).policyDefinitionId
            $builtinPolicyListActual | Should -Not -BeNullOrEmpty

            $comparison = Compare-Object -ReferenceObject $builtinPolicyListExpected -DifferenceObject $builtinPolicyListActual
            $comparison | Should -BeNullOrEmpty
        }

        It "Contains the desired default parameters for allowed resource types" {

            $expectedValue = $expectedPolicySetParameters.listOfResourceTypesAllowed.defaultValue 
            $actualValue = $actualPolicySet.Parameters.listOfResourceTypesAllowed.defaultValue
            $comparison = Compare-Object -ReferenceObject $expectedValue -DifferenceObject $actualValue
            $comparison | Should -BeNullOrEmpty
        }

        It "Contains the desired default parameters for allowed VM SKUs" {

            $expectedValue = $expectedPolicySetParameters.listOfAllowedVMSKUs.defaultValue
            $actualValue = $actualPolicySet.Parameters.listOfAllowedVMSKUs.defaultValue
            $comparison = Compare-Object -ReferenceObject $expectedValue -DifferenceObject $actualValue
            $comparison | Should -BeNullOrEmpty
        }

        It "Contains the desired default parameters for allowed SA SKUs" {

            $expectedValue = $expectedPolicySetParameters.listOfAllowedSASKUs.defaultValue
            $actualValue = $actualPolicySet.Parameters.listOfAllowedSASKUs.defaultValue
            $comparison = Compare-Object -ReferenceObject $expectedValue -DifferenceObject $actualValue
            $comparison | Should -BeNullOrEmpty
        }

        It "Contains the desired default parameters for approved extensions" {

            $expectedValue = $expectedPolicySetParameters.approvedExtensions.defaultValue
            $actualValue = $actualPolicySet.Parameters.approvedExtensions.defaultValue
            $comparison = Compare-Object -ReferenceObject $expectedValue -DifferenceObject $actualValue
            $comparison | Should -BeNullOrEmpty
        }
    }

    Context "When policy compliance is verified" {

        BeforeDiscovery {

            $policyStateJson = az policy state list -m $PolicyScope --query "[?contains(policyAssignmentId, 'contoso_governance')]"
            $policyState = $policyStateJson | ConvertFrom-Json

            $convertedStateList = @()
            foreach ($state in $policyState)
            {
                $convertedStateList += @{
                    PolicyName      = $state.policyDefinitionReferenceId
                    ComplianceState = $state.complianceState
                    ResourceId      = $state.resourceId
                }
            }

            if ($convertedStateList.count -lt 1)
            {
                throw "Policy State was not retrieved"
            }
        }

        It "<PolicyName> is <ComplianceState> for <ResourceId>" -ForEach $convertedStateList {

            $ComplianceState | Should -Be 'Compliant'
        }
    }

    Context "When remediations are run" {

        BeforeDiscovery {

            $policyRemediationJson = az policy remediation list -m $PolicyScope --query "[?contains(policyAssignmentId, 'contoso_governance')]"
            $policyRemediation = $policyRemediationJson | ConvertFrom-Json

            $convertedRemediationList = @()
            foreach ($remediation in $policyRemediation)
            {
                $convertedRemediationList += @{
                    Name  = $remediation.name
                    State = $remediation.provisioningState
                    DeploymentStatus = $remediation.deploymentStatus
                }
            }

            if ($convertedRemediationList.count -lt 1)
            {
                throw "Policy State was not retrieved"
            }
        }

        It "Remedation '<Name>' <State>" -ForEach $convertedRemediationList {

            $State | Should -Be 'Succeeded'
            $DeploymentStatus.failedDeployments | Should -Be 0
        }
    }
}
