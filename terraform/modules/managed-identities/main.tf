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

# Modules

resource "azurerm_user_assigned_identity" "caci-managed-identity" {
  for_each = var.mi_map
  name = each.value.mi_name
  resource_group_name = each.value.mi_rg
  location            = var.location

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}

# resource "azurerm_role_assignment" "assign_identity_storage_blob_data_contributor" {
#   scope                = azurerm_storage_account.my_storage_account.id
#   role_definition_name = "Storage Blob Data Contributor"
#   principal_id         = azurerm_user_assigned_identity.managed_identity.principal_id
# }
# resource "azurerm_storage_account" "my_storage_account" {
#   name                     = "mystorageaccount"
#   resource_group_name      = "my-resource-group"
#   location                 = "westus2"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   identity {
#     type = "UserAssigned"
#     identity_ids = [
#       azurerm_user_assigned_identity.managed_identity.id
#     ]
#   }
# }

# output "client_id" {
#   value = azurerm_user_assigned_identity.managed_identity.client_id
# }