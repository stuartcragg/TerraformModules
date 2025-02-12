#--------------------------------------------------------------------------------------------------------
# 1) Variables for Resource Group creation.
#--------------------------------------------------------------------------------------------------------

variable "subscription_id" {
  description = "The Azure subscription where the managed identity will be created"
  type = string
}

variable "tenant_id" {
  description = "Azure tenant ID for the deployment"
  type        = string
}

variable "location" {
  description = "Azure region for the deployment"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group for the managed idetity deployment"
  type = string
}

#--------------------------------------------------------------------------------------------------------
# 2) Variables for the managed identity and federated credential creation.
#--------------------------------------------------------------------------------------------------------

variable "mi_name" {
    description = "Name of the managed identity as seen on Azure"
    type = string
}

variable "github_org" {
    description = "GitHub organization"
    type = string
}

variable "github_repo" {
    description = "GitHub repository that the service connection will have access to"
}

#--------------------------------------------------------------------------------------------------------
# 3) Variables for RBAC role assignment.
#--------------------------------------------------------------------------------------------------------

variable "scope" {
  description = "Scope of where to apply the permissions for the managed identity."
  type = string
}

variable "role_definition_name" {
  description = "Which role to assign to the managed identity at the given scope"
  type = string
  default = "Contributor"
}



