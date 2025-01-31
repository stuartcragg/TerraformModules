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

resource "azurerm_user_assigned_identity" "mi" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.identity_name  
}

// Outputs

output "identity_name" {
  description = "Name of the managed identity"
  value = azurerm_user_assigned_identity.mi.name
}

output "identity_id" {
  description = "Resource ID of the managed identity"
  value = azurerm_user_assigned_identity.mi.id
}