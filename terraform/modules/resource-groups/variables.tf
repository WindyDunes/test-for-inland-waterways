variable "resource_group_names" {
  description = "Default resource group name that the network will be created in."
  type        = list(string)
}

variable "location" {
  description = "The location/region where the core network will be created."
  type        = string
}
