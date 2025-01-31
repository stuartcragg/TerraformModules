//Create the outputs

output "resource_group_name" {
    description = "The name of the resource group"
    value = azurerm_resource_group.rg.name
}

output "resource_group_id" {
    description = "ID of the resource group"
    value = azurerm_resource_group.rg.id
    sensitive = true
}

output "resource_group_location" {
  description = "Location of the resource group on Azure"  
  value = azurerm_resource_group.rg.location
}
