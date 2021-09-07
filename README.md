# cas-foundations-enterprise

- IaC using Terraform for Compute and Storage - Enterprise Tenant level resources
- Add Management groups for Contoso Tenant. Note: Subscriptions are not being added to Management groups programmtically as subscriptions are not created programmatically
- Azure Policies
- GitHub Actions pipeline to deploy automatically with Service Principal

## How to use

For additional policy set definition and assignment, create a new tfvars file for the policy group and add a step to the workflow to run terraform using that file.
