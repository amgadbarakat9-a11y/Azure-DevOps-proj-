output "bastion_public_ip" {
  value = module.compute.bastion_public_ip
}


output "app_private_ip1" {
  value = module.compute.app_private_ip1
}

output "app_private_ip2" {
  value = module.compute.app_private_ip2
}

output "public_lb_ip" {
  value = module.Network.public_lb_ip
}

output "mysql_fqdn" {
  value = module.Database.mysql_fqdn
}