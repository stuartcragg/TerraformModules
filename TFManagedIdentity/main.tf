// Providers configuration

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

// Create the user assigned managed identity

resource "azurerm_user_assigned_identity" "user_assigned_identity" {
  location            = var.location
  name                = var.mi_name
  resource_group_name = var.rg_name
}

// Outputs

output "mi_name" {
  description = "Name of the managed identity"
  value = azurerm_user_assigned_identity.user_assigned_identity.name
}

output "mi_id" {
  description = "Resource ID of the managed identity"
  value = azurerm_user_assigned_identity.user_assigned_identity.id
}