terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 4.18.0"
        }
        azuread = {
            source = "hashicorp/azuread"
            version = "~> 3.1.0"
        }
    }
}

provider "azurerm" {
    features {}
    subscription_id = var.subscription_id
}

provider "azuread" {
}