resource "azurerm_public_ip" "pip" {
  name                = "pip"
  resource_group_name = var.resource_group_name
    location            = var.location
  allocation_method   = "Static"
  
}


resource "azurerm_network_interface" "nic1" {
  name                = "NIC1"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.bastion_subnet_id
        private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}


resource "azurerm_network_interface" "nic2" {
  name                = "NIC2"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.app_subnet1_id
        private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic3" {
  name                = "NIC3"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.app_subnet2_id
        private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "vm1_assoc" {
  network_interface_id    = azurerm_network_interface.nic2.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = var.backend_pool_id
}

resource "azurerm_network_interface_backend_address_pool_association" "vm2_assoc" {
  network_interface_id    = azurerm_network_interface.nic3.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = var.backend_pool_id
}
