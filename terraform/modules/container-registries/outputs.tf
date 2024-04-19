output "caci-acr" {
  # use this for count
  # value = zipmap( azurerm_container_registry.caci-acr.*.name, azurerm_kazurerm_container_registryey_vault.caci-acr.*.id ) 
  # use this for for_each
  value = zipmap( values(azurerm_container_registry.caci-acr)[*].name, values(azurerm_container_registry.caci-acr)[*].id ) 
}