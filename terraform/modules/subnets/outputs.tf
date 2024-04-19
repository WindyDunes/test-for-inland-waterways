output "caci-subnet" {
    # use this for count
    # value = zipmap( azurerm_subnet.caci-subnet.*.name, azurerm_subnet.caci-subnet.*.id ) 
    # use this for for_each
    value = zipmap( values(azurerm_subnet.caci-subnet)[*].name, values(azurerm_subnet.caci-subnet)[*].id ) 
}
