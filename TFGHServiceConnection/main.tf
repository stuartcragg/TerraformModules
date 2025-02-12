#--------------------------------------------------------------------------------------------------------
# 1) Call the Resource Group Module to deploy the Resource Group for the managed identity.
#--------------------------------------------------------------------------------------------------------

module "resource_group" {
    source = "github.com/stuartcragg/TerraformModules//TFResourceGroup?ref=main"

    resource_group_name = var.rg_name
    location = var.location
    subscription_id = var.subscription_id
    tenant_id = var.tenant_id

tags = {
    workload = "Managed Identity"
    // Add more tags here as required
}
}

#--------------------------------------------------------------------------------------------------------
# 2) Call the Managed Identity module and deploy into the pre-created resource group.
#--------------------------------------------------------------------------------------------------------

module "managed_identity" {
    source = "github.com/stuartcragg/TerraformModules//TFManagedIdentity?ref=main"

    resource_group_name = module.resource_group.resource_group_name
    location = var.location
    identity_name = var.mi_name
}

#--------------------------------------------------------------------------------------------------------
# 3) Create a federated identity credential for the user-assigned identity.
#--------------------------------------------------------------------------------------------------------

resource "azurerm_federated_identity_credential" "github_oidc" {
  name                = "github-oidc"
  resource_group_name = module.resource_group.resource_group_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  parent_id           = module.managed_identity.identity_id
  subject             = "repo:${var.github_org}/${var.github_repo}:ref:refs/heads/main"
}

#--------------------------------------------------------------------------------------------------------
# 4) Create the role assignment for the managed identity. 
#--------------------------------------------------------------------------------------------------------

data "azurerm_subscription" "primary" {
}

resource azurerm_role_assignment "github_mi_permissions" {
  #scope                = data.azurerm_subscription.primary.id
  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = module.managed_identity.identity_principal_id
}

