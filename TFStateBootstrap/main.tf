// Providers configuration

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
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

// Locals block for configuration

locals {
  storage_account_name = "${var.storage_account}${random_string.suffix.result}"
}

// Create the Resource Group for Terraform State Storage Account

resource "azurerm_resource_group" "tf_state_rg" {
  name     = lower(var.tf_state_rg)
  location = var.location

  tags = var.tags
}

// Create Storage Account for Terraform State

resource "azurerm_storage_account" "tf_state_storage" {
  resource_group_name = azurerm_resource_group.tf_state_rg.name
  location            = azurerm_resource_group.tf_state_rg.location
  name                = lower(local.storage_account_name)

  account_tier              = "Standard"
  account_kind              = "BlobStorage"
  account_replication_type  = "GRS"
  enable_https_traffic_only = true

  blob_properties {
    versioning_enabled = true
    delete_retention_policy {
      days = 365
    }
    container_delete_retention_policy {
      days = 90
    }
  }
  lifecycle {
    prevent_destroy = true
  }

  tags = var.tags
}

// Create the Storage Container for Terraform State

resource "azurerm_storage_container" "state" {
  name                  = lower("tfstate")
  storage_account_name  = azurerm_storage_account.tf_state_storage.name
  container_access_type = "private"
  lifecycle {
    prevent_destroy = true
  }
}

// Create the RBAC roles for the current user

resource "azurerm_role_assignment" "storage_account_rbac_current_user" {
  scope                = azurerm_storage_account.tf_state_storage.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id

  depends_on = [azurerm_storage_account.tf_state_storage]
}

