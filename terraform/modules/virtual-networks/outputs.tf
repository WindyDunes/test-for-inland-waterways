output "caci-vnet" {
  # use this for count
  #value = zipmap( azurerm_virtual_network.caci-vnet.*.name, azurerm_virtual_network.caci-vnet.*.id )
  # use this for for_each
  value = zipmap( values(azurerm_virtual_network.caci-vnet)[*].name, values(azurerm_virtual_network.caci-vnet)[*].id ) 
}