output "caci-managed-identity" {
  # use this for count
  # value = zipmap( azurerm_user_assigned_identity.caci-managed-identity.*.name, azurerm_user_assigned_identity.caci-managed-identity.*.id ) 
  # use this for for_each
  value = zipmap( values(azurerm_user_assigned_identity.caci-managed-identity)[*].name, values(azurerm_user_assigned_identity.caci-managed-identity)[*].id ) 
}