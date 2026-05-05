output "bastion_subnet_id" {
  value = azurerm_subnet.sub1.id
}

output "app_subnet_id" {
  value = azurerm_subnet.sub2.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}