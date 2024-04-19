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

data "azurerm_network_security_group" "caci-nsg" {
  for_each = var.nsg_map
  name = each.value.nsg_name
  resource_group_name  = each.value.nsg_rg
}

data "azurerm_user_assigned_identity" "caci-managed-identity" {
  for_each = var.mi_map
  name = each.value.mi_name
  resource_group_name = each.value.mi_rg
}

# Modules

resource "azurerm_storage_account" "caci-sa" {
  for_each            = var.sa_map
  name                = each.value.sa_name
  location            = var.location
  resource_group_name = each.value.sa_rg
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}