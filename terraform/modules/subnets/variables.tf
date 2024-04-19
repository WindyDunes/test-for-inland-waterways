variable "location" {
  description = "The location/region where the vnet will be created (module)"
  type        = string
}

variable "resource_group_names" {
  description = "Default resource group name that the network will be created in."
  type        = list(string)
}

variable "vnet_map" {
  type = map(object({
    vnet_name = string
    vnet_rg = string
    vnet_address_space = string
  }))
}

variable "subnet_map" {
  type = map(object({
    subnet_name = string
    subnet_vnet_name = string
    subnet_rg = string
    subnet_address_space = string
  }))
}
