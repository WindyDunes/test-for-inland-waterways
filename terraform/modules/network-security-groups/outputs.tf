output "scaci-nsg" {
    # use this for count
    # value = zipmap( azurerm_network_security_group.caci-nsg.*.name, azurerm_network_security_group.caci-nsg.*.id ) 
    # use this for for_each
    value = zipmap( values(azurerm_network_security_group.caci-nsg)[*].name, values(azurerm_network_security_group.caci-nsg)[*].id )
}