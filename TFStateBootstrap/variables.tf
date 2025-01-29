// Variables configuration

variable "subscription_id" {
  description = "Azure subscriptionID for the deployment"
}

variable "tenant_id" {
  description = "Azure tenant ID for the deployment"
}

variable "tf_state_rg" {
  description = "New Resource Group will be created for the TF state resources"
}

variable "environment" {
  description = "Is this envronment Production / Staging / Development etc ?"
}

variable "location" {
  description = "Azure region for the deployment"
}

variable "storage_account" {
  description = "Name of the storage account for the Terraform state"

  validation {
    condition = (
      length(var.storage_account) <= 19 &&
      can(regex("^[a-z0-9]+[a-z0-9]*$", var.storage_account))
    )
    error_message = "The storage account name must be exactly 19 characters, and can only contain lowercase letters and numbers."
  }
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

// Random String generation for the storage account name

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}
