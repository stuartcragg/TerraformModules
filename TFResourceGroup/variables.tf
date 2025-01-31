// Variables configuration

variable "subscription_id" {
  description = "Azure subscriptionID for the deployment"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID for the deployment"
  type        = string
}

variable "resource_group_name" {
  description = "New Resource Group will be created with this name"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.resource_group_name))
    error_message = "The resource group name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "location" {
  description = "Azure region for the deployment"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
