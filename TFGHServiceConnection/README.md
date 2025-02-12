# GitHub Service Connection Module

This module creates an Azure Resource Group, a managed identity and federated credential for OpenID Connect.

## Inputs

The following variables are required. Example files for variables.tf and terraform.tfvars provided.

- `subscription_id` : Subscription where the managed identity will be deployed.
- `tenant_id` : Tenant ID for the deployment.
- `location` : Azure region location for the deployment.
- `rg_name` : Resource Group name for the managed identity.
- `mi_name` : Name of the managed identity that will be used for OpenID Connect.
- `github_org` : GitHub Organization name for the OpenID Connect Credential.
- `github_repo` : Spefic Repo for OpenID Connect.
- `scope` : Scope that the managed identity will be granted permission to. In resourceID format.




