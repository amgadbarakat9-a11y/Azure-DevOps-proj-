resource "azurerm_network_security_group" "nsg1" {
name = "${var.vnet_name}-nsg1"
  location            = var.location
  resource_group_name = var.resource_group_name
  security_rule {
    name                       = "allow-ssh"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow-Http"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    name = "nsg-ssh"
  }
}



resource "azurerm_network_security_group" "nsg2" {
name = "${var.vnet_name}-nsg2"
  location            = var.location
  resource_group_name = var.resource_group_name
  security_rule {
    name                       = "app-nsg"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3000"
    source_address_prefix      = "*"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
  name                       = "allow-lb"
  priority                   = 103
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "3000"
  source_address_prefix      = "AzureLoadBalancer"
  destination_address_prefix = "VirtualNetwork"
}

   security_rule {
    name                       = "allow-app-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "VirtualNetwork"
  }

  tags = {
    name = "app-nsg"
  }
}




resource "azurerm_subnet_network_security_group_association" "snsg1" {
  subnet_id                 = azurerm_subnet.sub1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}




resource "azurerm_subnet_network_security_group_association" "snsg2" {
  subnet_id                 = azurerm_subnet.sub2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}

resource "azurerm_subnet_network_security_group_association" "snsg3" {
  subnet_id                 = azurerm_subnet.sub3.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}