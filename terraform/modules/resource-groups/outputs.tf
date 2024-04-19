output "caci-rg" {
  # use this for count
  # value = zipmap( azurerm_resource_group.caci-rg.*.name, azurerm_resource_group.caci-rg.*.id )
  # use this for for_each
  value = zipmap( values(azurerm_resource_group.caci-rg)[*].name, values(azurerm_resource_group.caci-rg)[*].id ) 
}