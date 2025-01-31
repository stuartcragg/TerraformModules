locals {
  common_tags = merge(var.tags, {
    ManagedBy   = "Terraform"
  })
}

// Create the resource group

resource "azurerm_resource_group" "rg" {
  name     = lower(var.resource_group_name)
  location = var.location

  tags = local.common_tags
}