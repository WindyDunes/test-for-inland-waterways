output "caci-sa" {
  # use this for count
  # value = zipmap( azurerm_storage_account.caci-sa.*.name, azurerm_storage_account.caci-sa.*.id ) 
  # use this for for_each
  value = zipmap( values(azurerm_storage_account.caci-sa)[*].name, values(azurerm_storage_account.caci-sa)[*].id ) 
}