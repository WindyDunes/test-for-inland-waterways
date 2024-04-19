# Modules

resource "azurerm_resource_group" "caci-rg" {
  # count    = length(var.resource_group_names)
  # name     = element(var.resource_group_names, count.index)
  for_each = toset(var.resource_group_names)
  name     = each.value
  location = var.location

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}
