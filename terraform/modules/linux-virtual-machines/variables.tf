variable "resource_group_name" {
  type		= string
  description	= "Resource Group Name"
}

variable "location" {
  type		= string
  description	= "Location of Region"
}

variable "subnet_id" {
  type		= string
  description	= "ID of subnet"
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureadmin"
}
