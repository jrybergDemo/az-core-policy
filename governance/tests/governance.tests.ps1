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

    $azJson = az policy set-definition show -n EITaaS_Governance --management-group $PolicyScope
    $actualPolicySet = $azJson | ConvertFrom-Json
  }

  Context "When policy is deployed" {

    It "Deploys all desired custom policy" {

      $policyListExpected = $expectedPolicySet.policy_definition_reference.policy_definition_id
      $policyListExpected | Should -Not -BeNullOrEmpty

      $policyListActual = $actualPolicySet.PolicyDefinitions.policyDefinitionId
      $policyListActual | Should -Not -BeNullOrEmpty

      $comparison = Compare-Object -ReferenceObject $policyListExpected -DifferenceObject $policyListActual
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

    It "Contains the desired default parameters for allowed resource locations" {

      $expectedValue = $expectedPolicySetParameters.listOfAllowedLocations.defaultValue
      $actualValue = $actualPolicySet.Parameters.listOfAllowedLocations.defaultValue
      $comparison = Compare-Object -ReferenceObject $expectedValue -DifferenceObject $actualValue
      $comparison | Should -BeNullOrEmpty
    }
  }
}
