variable "resource_group_name" {
  description = "Name of the resource group for the managed identity"
  type = string
}

variable "location" {
  description = "Azure region for the deployment"
  type = string
}

variable "identity_name" {
  description = "Name of the managed identity"
  type = string
}