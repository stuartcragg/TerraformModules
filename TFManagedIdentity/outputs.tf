// Outputs

output "identity_name" {
  description = "Name of the managed identity"
  value = azurerm_user_assigned_identity.mi.name
}

output "identity_id" {
  description = "Resource ID of the managed identity"
  value = azurerm_user_assigned_identity.mi.id
}