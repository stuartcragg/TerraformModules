// Providers configuration

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

// Get Current Config

data "azurerm_client_config" "current" {}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

// Create the resource group

resource "azurerm_resource_group" "rg" {
  name     = lower(var.rg_name)
  location = var.location

  tags = var.tags
}

//Create the outputs

output "rg_name" {
    description = "The name of the resource group"
    value = azurerm_resource_group.rg.name
}

output "resource_group_id" {
    description = "ID of the resource group"
    value = azurerm_resource_group.rg.id
}