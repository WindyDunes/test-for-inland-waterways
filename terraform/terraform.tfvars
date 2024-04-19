location = "East US"

resource_group_names = [
    "Clearwater-container-registry-rg",
    "FortDesoto-hub-rg",
    "Egmont-spoke-devtest-azdevops-rg",
    "IslaDelSol-spoke-devtest-github-rg",
    "LongBoat-spoke-auxillary-rg",
    "MadieraBeach-spoke-devtest-github-rg",
    "TierraVerde-spoke-devtest-azdevops-rg",
    "TreasureIsland-spoke-auxillary-rg",
    "Tampa-arsv-rg",
    "caci-resource-group"]

vnet_map = {
    vnet1 = {
      vnet_name = "Egmont-TierraVerde-spoke-vnet"
      vnet_rg = "Egmont-spoke-devtest-azdevops-rg"
      vnet_address_space = "10.0.1.0/24"
    }
    vnet2 = {
      vnet_name = "FortDesoto-Hub-vnet"
      vnet_rg = "FortDesoto-hub-rg"
      vnet_address_space = "10.0.0.0/24"
    }
    vnet3 = {
      vnet_name = "LongBoat-TreasureIsland-spoke-vnet"
      vnet_rg = "LongBoat-spoke-auxillary-rg"
      vnet_address_space = "10.0.3.0/24"
    }
    vnet4 = {
      vnet_name = "MadieraBeach-IslaDelSol-spoke-vnet"
      vnet_rg = "MadieraBeach-spoke-devtest-github-rg"
      vnet_address_space = "10.0.2.0/24"
    }
    vnet5 = {
      vnet_name = "caci-vnet"
      vnet_rg = "caci-resource-group"
      vnet_address_space = "10.0.0.0/24"
    }
  }

subnet_map = {
    subnet1 = {
      subnet_name = "Egmont-spoke-devtest-azdevops-subnet-vnet"
      subnet_vnet_name = "Egmont-TierraVerde-spoke-vnet"
      subnet_rg = "Egmont-spoke-devtest-azdevops-rg"
      subnet_address_space = "10.0.1.0/26"
    }
    subnet2 = {
      subnet_name = "TierraVerde-spoke-devtest-azdevops-subnet-vnet"
      subnet_vnet_name = "Egmont-TierraVerde-spoke-vnet"
      subnet_rg = "Egmont-spoke-devtest-azdevops-rg"
      subnet_address_space = "10.0.1.128/26"
    }
    subnet3 = {
      subnet_name = "FortDesoto-hub-resources-subnet"
      subnet_vnet_name = "FortDesoto-Hub-vnet"
      subnet_rg = "FortDesoto-hub-rg"
      subnet_address_space = "10.0.0.0/27"
    }
    subnet4 = {
      subnet_name = "AzureBastionSubnet"
      subnet_vnet_name = "FortDesoto-Hub-vnet"
      subnet_rg = "FortDesoto-hub-rg"
      subnet_address_space = "10.0.0.32/28"
    }
    subnet5 = {
      subnet_name = "AzureSiteRecovery-subnet"
      subnet_vnet_name = "FortDesoto-Hub-vnet"
      subnet_rg = "FortDesoto-hub-rg"
      subnet_address_space = "10.0.0.64/26"
    }
    subnet6 = {
      subnet_name = "LongBoat-spoke-auxillary-subnet-vnet"
      subnet_vnet_name = "LongBoat-TreasureIsland-spoke-vnet"
      subnet_rg = "LongBoat-spoke-auxillary-rg"
      subnet_address_space = "10.0.3.0/25"
    }
    subnet7 = {
      subnet_name = "TreasureIsland-spoke-auxillary-subnet-vnet"
      subnet_vnet_name = "LongBoat-TreasureIsland-spoke-vnet"
      subnet_rg = "LongBoat-spoke-auxillary-rg"
      subnet_address_space = "10.0.3.128/25"
    }
    subnet8 = {
      subnet_name = "MadieraBeach-spoke-devtest-github-subnet-vnet"
      subnet_vnet_name = "MadieraBeach-IslaDelSol-spoke-vnet"
      subnet_rg = "MadieraBeach-spoke-devtest-github-rg"
      subnet_address_space = "10.0.2.0/26"
    }
    subnet9 = {
      subnet_name = "IslaDelSol-spoke-devtest-github-subnet-vnet"
      subnet_vnet_name = "MadieraBeach-IslaDelSol-spoke-vnet"
      subnet_rg = "MadieraBeach-spoke-devtest-github-rg"
      subnet_address_space = "10.0.2.128/26"
    }
    subnet10 = {
      subnet_name = "caci-subnet"
      subnet_vnet_name = "caci-vnet"
      subnet_rg = "caci-resource-group"
      subnet_address_space = "10.0.0.0/26"
    }
  }

nsg_map = {
    nsg1 = {
      nsg_name = "AzureBastionSubnet-nsg"
      nsg_rg = "FortDesoto-hub-rg"
    }
    nsg2 = {
      nsg_name = "FortDeSoto-NSG"
      nsg_rg = "FortDesoto-hub-rg"
    }
    nsg3 = {
      nsg_name = "FortDesoto-hub-resources-nsg"
      nsg_rg = "FortDesoto-hub-rg"
    }
    nsg4 = {
      nsg_name = "Egmont-TierraVerde-nsg"
      nsg_rg = "Egmont-spoke-devtest-azdevops-rg"
    }
    nsg5 = {
      nsg_name = "Egmont-TierraVerde-vnet-nsg"
      nsg_rg = "Egmont-spoke-devtest-azdevops-rg"
    }
    nsg6 = {
      nsg_name = "Egmont-spoke-nsg"
      nsg_rg = "Egmont-spoke-devtest-azdevops-rg"
    }
    nsg7 = {
      nsg_name = "TierraVerde-spoke-nsg"
      nsg_rg = "Egmont-spoke-devtest-azdevops-rg"
    }
    nsg8 = {
      nsg_name = "LongBoat-spoke-nsg"
      nsg_rg = "LongBoat-spoke-auxillary-rg"
    }
    nsg9 = {
      nsg_name = "TreasureIsland-spoke-nsg"
      nsg_rg = "LongBoat-spoke-auxillary-rg"
    }
    nsg10 = {
      nsg_name = "IslaDelSol-spoke-nsg"
      nsg_rg = "MadieraBeach-spoke-devtest-github-rg"
    }
    nsg11 = {
      nsg_name = "MadieraBeach-spoke-nsg"
      nsg_rg = "MadieraBeach-spoke-devtest-github-rg"
    }
  }

mi_map = {
    mi1 = {
      mi_name = "AzureDevOpsServer2020-user-assigned-mi"
      mi_rg   = "FortDesoto-hub-rg"
    }
}

sa_map = {
    sa1 = {
      sa_name = "fortdesotostorageaccount"
      sa_rg   = "FortDesoto-hub-rg"
      account_tier = "Standard"
      account_replication_type = "GRS"
    }
}

kv_map = {
    kv1 = {
      kv_name = "FortDesoto-kv"
      kv_rg   = "FortDesoto-hub-rg"
      enabled_for_disk_encryption = true
      soft_delete_retention_days = 7
      purge_protection_enabled = false
      sku_name = "standard"
    }
}

acr_map = {
    acr1 = {
      acr_name = "clearwateracrspathe"
      acr_rg   = "Clearwater-container-registry-rg"
      sku = "Premium"
      identity_type = "UserAssigned"
      encryption_enabled = true
      admin_enabled = true
    }
}

arsv_map = {
    arsv1 = {
      arsv_name = "tamparsvspathe"
      arsv_rg   = "Tampa-arsv-rg"
      sku = "Standard"
      soft_delete_enabled = true
    }
}
