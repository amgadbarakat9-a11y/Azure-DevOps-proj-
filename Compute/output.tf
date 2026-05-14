output "bastion_public_ip" {
  description = "Public IP of the bastion VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "bastion_private_ip" {
  description = "Private IP of the bastion VM"
  value       = azurerm_network_interface.nic1.private_ip_address
}

output "app_private_ip1" {
  description = "Private IP of the app VM"
  value       = azurerm_network_interface.nic2.private_ip_address
}

output "app_private_ip2" {
  description = "Private IP of the app VM"
  value       = azurerm_network_interface.nic3.private_ip_address
}

output "bastion_vm_id" {
  description = "ID of the bastion VM"
  value       = azurerm_linux_virtual_machine.vm1.id
}

output "app_vm1_id" {
  description = "ID of the app VM"
  value       = azurerm_linux_virtual_machine.vm2.id
}

output "app_vm2_id" {
  description = "ID of the app VM"
  value       = azurerm_linux_virtual_machine.vm3.id
}