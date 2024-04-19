variable "location" {
  description = "The location/region where the security group will be created."
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

variable "nsg_map" {
  type = map(object({
    nsg_name = string
    nsg_rg = string
  }))
}

variable "mi_map" {
  type = map(object({
    mi_name = string
    mi_rg = string
  }))
}

variable "sa_map" {
  type = map(object({
    sa_name = string
    sa_rg = string
    account_tier = string
    account_replication_type = string
  }))
}

variable "kv_map" {
  type = map(object({
    kv_name = string
    kv_rg = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days = number
    purge_protection_enabled = bool
    sku_name = string
  }))
}

variable "acr_map" {
  type = map(object({
    acr_name = string
    acr_rg = string
    sku = string
    identity_type = string
    encryption_enabled = bool
    admin_enabled = bool
  }))
}

variable "arsv_map" {
  type = map(object({
    arsv_name = string
    arsv_rg = string
    sku = string
    soft_delete_enabled = bool
  }))
}