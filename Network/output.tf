output "bastion_subnet_id" {
  value = azurerm_subnet.sub1.id
}

output "app_subnet1_id" {
  value = azurerm_subnet.sub2.id
}

output "app_subnet2_id" {
  value = azurerm_subnet.sub3.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "public_lb_ip" {
  value = azurerm_public_ip.lb_public_ip.ip_address
}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}

output "subnet4_id" {
  value = azurerm_subnet.sub4.id
}

