# output "caci-rg" {
#   value = zipmap( module.resource-groups.azurerm_resource_group.caci-rg.*.name, module.resource-groups.azurerm_resource_group.caci-rg.*.id ) 
# }

# output "caci-vnet" {
#   value = zipmap( module.vnets.*.name, module.vnets.*.id ) 
# }

# output "caci-subnet" {
#     value = zipmap( module.subnets.*.name, module.subnets.*.id ) 
# }

# output "subnet_nsg" {
#     value = zipmap( module.nsgs.*.name, module.nsgs.*.id ) 
# }

