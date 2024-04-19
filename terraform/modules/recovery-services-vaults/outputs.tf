output "caci-arsv" {
  # use this for count
  # value = zipmap( azurerm_recovery_services_vault.caci-arsv.*.name, azurerm_kazurerm_recovery_services_vaultey_vault.caci-arsv.*.id ) 
  # use this for for_each
  value = zipmap( values(azurerm_recovery_services_vault.caci-arsv)[*].name, values(azurerm_recovery_services_vault.caci-arsv)[*].id ) 
}