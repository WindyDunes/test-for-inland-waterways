
# Dependancies

data "azurerm_resource_group" "caci-rg" {
  # count    = length(var.resource_group_names)
  # name     = element(var.resource_group_names, count.index)
  for_each = toset(var.resource_group_names)
  name     = each.value
}

data "azurerm_virtual_network" "caci-vnet" {
  for_each = var.vnet_map
  name = each.value.vnet_name
  resource_group_name = each.value.vnet_rg
}

data "azurerm_subnet" "caci-subnet" {
  for_each = var.subnet_map
  name = each.value.subnet_name
  resource_group_name  = each.value.subnet_rg
  virtual_network_name = each.value.subnet_vnet_name
}

# Modules

resource "azurerm_network_security_group" "caci-nsg" {
  for_each = var.nsg_map
  name = each.value.nsg_name
  resource_group_name  = each.value.nsg_rg
  location              = var.location # Optional; if not provided, will use Resource Group location
  
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  # depends_on = [azurerm_resource_group.example]
}