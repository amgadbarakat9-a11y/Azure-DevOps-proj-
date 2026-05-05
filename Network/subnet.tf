resource "azurerm_subnet" "sub1" {
  name                 = var.subnet1_name
resource_group_name = var.resource_group_name
virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet1_prefix
}


resource "azurerm_subnet" "sub2" {
  name                 = var.subnet2_name
resource_group_name = var.resource_group_name
virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet2_prefix
}