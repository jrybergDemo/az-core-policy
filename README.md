# Subscription Bootstrap Steps

1. Create Subscription
1. Create AAD
1. Create Management Group & add subscription
1. Create SP & save output 
   1. az ad sp create-for-rbac --name "$($env:sp_name)" --sdk-auth --role contributor --scopes "$($env:sp_scope)"
1. Add Management Group Reader & Resource Policy Contributor to SP on root MG
1. Create GitHub Repository
1. Add secrets to GitHub Repo
   1. Add 'TEST' GitHub Environment as well (Enterprise licensing only)
1. Create Terraform backend Azure resources
1. Notes
   1. If using PS AZ module, login with - `Select-AzSubscription -Tenant $env:tenant_id -Subscription $env:sub_id`
   1. Can use the bootstrap workflow, but needs merged into main to work well