# Create public IPs
resource "azurerm_public_ip" "caci-demo-public-ip" {
  name                = "caci-demo-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "caci-demo-nsg" {
  name                = "caci-demo-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "caci-demo-nic" {
  name                = "caci-demo-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "caci-demo-nic-config"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.caci-demo-public-ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.caci-demo-nic.id
  network_security_group_id = azurerm_network_security_group.caci-demo-nsg.id
}

# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.resource_group_name
  }

  byte_length = 8
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "caci-demo-vm" {
  name                  = "caci-demo-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.caci-demo-nic.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "caci-demo-vm"
  admin_username = var.username
  # insecure, consider compromised
  admin_password = "foobarABC123!"
  disable_password_authentication = false

#  admin_ssh_key {
#    username   = var.username
#    public_key = file("./files/id_rsa.pub")
#  }
  tags = {
    caci-demo = "True"
  }
}
