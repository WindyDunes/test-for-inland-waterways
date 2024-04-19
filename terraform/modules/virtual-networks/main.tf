
# Dependancies

data "azurerm_resource_group" "caci-rg" {
  # count    = length(var.resource_group_names)
  # name     = element(var.resource_group_names, count.index)
  for_each = toset(var.resource_group_names)
  name     = each.value
}

# Modules

resource "azurerm_virtual_network" "caci-vnet" {
  for_each = var.vnet_map
  location            = var.location # Optional; if not provided, will use Resource Group location
  name = each.value.vnet_name
  resource_group_name = each.value.vnet_rg
  address_space       = [each.value.vnet_address_space]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}
