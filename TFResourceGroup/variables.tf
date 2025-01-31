// Variables configuration

variable "subscription_id" {
  description = "Azure subscriptionID for the deployment"
}

variable "tenant_id" {
  description = "Azure tenant ID for the deployment"
}

variable "resource_group_name" {
  description = "New Resource Group will be created with this name"
  type = string
}

variable "location" {
  description = "Azure region for the deployment"
  type = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}
