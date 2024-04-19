terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    subscription_id       = ""
    resource_group_name   = "tfstate"
    storage_account_name  = "tfstate30694"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }

}

# Modules

module "service-principals" {
  source	                = "./modules/service-principals"
}

module "resource-groups" {
  source 	                = "./modules/resource-groups"
  location                = var.location
  resource_group_names    = var.resource_group_names
  depends_on              = [module.service-principals]
}

module "virtual-networks" {
  source 	                = "./modules/virtual-networks"
  location                = var.location
  resource_group_names    = var.resource_group_names
  vnet_map                = var.vnet_map
  depends_on              = [module.resource-groups]
}

module "subnets" {
  source	                = "./modules/subnets"
  location                = var.location
  vnet_map                = var.vnet_map
  subnet_map              = var.subnet_map
  resource_group_names    = var.resource_group_names
  depends_on              = [module.virtual-networks]
}


module "network-security-groups" {
  source	                = "./modules/network-security-groups"
  location                = var.location
  vnet_map                = var.vnet_map
  subnet_map              = var.subnet_map
  nsg_map                 = var.nsg_map
  resource_group_names    = var.resource_group_names
  depends_on              = [module.subnets]
}

module "managed-identities" {
  source	                = "./modules/managed-identities"
  location                = var.location
  vnet_map                = var.vnet_map
  subnet_map              = var.subnet_map
  nsg_map                 = var.nsg_map
  mi_map                  = var.mi_map
  resource_group_names    = var.resource_group_names
  depends_on              = [module.network-security-groups]
}

module "storage-accounts" {
  source	                = "./modules/storage-accounts"
  location                = var.location
  vnet_map                = var.vnet_map
  subnet_map              = var.subnet_map
  nsg_map                 = var.nsg_map
  mi_map                  = var.mi_map
  sa_map                  = var.sa_map
  resource_group_names    = var.resource_group_names
  depends_on              = [module.managed-identities]
}

module "key-vaults" {
  source	                = "./modules/key-vaults"
  location                = var.location
  vnet_map                = var.vnet_map
  subnet_map              = var.subnet_map
  nsg_map                 = var.nsg_map
  mi_map                  = var.mi_map
  sa_map                  = var.sa_map
  kv_map                  = var.kv_map
  resource_group_names    = var.resource_group_names
  depends_on              = [module.storage-accounts]
}

module "container-registries" {
  source	                = "./modules/container-registries"
  location                = var.location
  vnet_map                = var.vnet_map
  subnet_map              = var.subnet_map
  nsg_map                 = var.nsg_map
  mi_map                  = var.mi_map
  sa_map                  = var.sa_map
  kv_map                  = var.kv_map
  acr_map                 = var.acr_map
  resource_group_names    = var.resource_group_names
  depends_on              = [module.key-vaults]
}

module "recovery-services-vaults" {
  source	                = "./modules/recovery-services-vaults"
  location                = var.location
  vnet_map                = var.vnet_map
  subnet_map              = var.subnet_map
  nsg_map                 = var.nsg_map
  mi_map                  = var.mi_map
  sa_map                  = var.sa_map
  kv_map                  = var.kv_map
  acr_map                 = var.acr_map
  arsv_map                = var.arsv_map
  resource_group_names    = var.resource_group_names
  depends_on              = [module.container-registries]
}

module "role-definitions" {
  source	                = "./modules/role-definitions"
  depends_on              = [module.recovery-services-vaults]
}

module "role-assignments" {
  source	                = "./modules/role-assignments"
  depends_on              = [module.role-definitions]
}

module "policy-definitions" {
  source	                = "./modules/policy-definitions"
  depends_on              = [module.role-assignments]
}

module "policy-assignments" {
  source	                = "./modules/policy-assignments"
  depends_on              = [module.policy-definitions]
}

# module "linux-virtual-machines" {
#   source		            = "./modules/linux-virtual-machines"
#   resource_group_name	  = "caci-resource-group"
#   location		          = "East US"
#   subnet_id		          = module.subnet.subnet_id
# }
