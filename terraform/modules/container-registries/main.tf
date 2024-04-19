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

data "azurerm_storage_account" "caci-sa" {
  for_each            = var.sa_map
  name                = each.value.sa_name
  resource_group_name = each.value.sa_rg
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "caci-kv" {
  for_each            = var.kv_map
  name                = each.value.kv_name
  resource_group_name = each.value.kv_rg
}


# Modules


resource "azurerm_container_registry" "caci-acr" {
  for_each            = var.acr_map
  name                = each.value.acr_name
  location            = var.location
  resource_group_name = each.value.acr_rg
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
  # identity {
  #   type = each.value.identity_type
  #   identity_ids = [
  #     data.azurerm_user_assigned_identity.caci-managed-identity[mi1].mi_name
  #   ]
  # }

  # encryption {
  #   enabled            = each.value.encryption_enabled
  #   key_vault_key_id   = data.azurerm_key_vault.caci-kv[kv1].id
  #   identity_client_id = data.azurerm_user_assigned_identity.caci-managed-identity[mi1].client_id
  # }

}

# resource "azurerm_user_assigned_identity" "example" {
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location

#   name = "registry-uai"
# }


