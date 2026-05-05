module "Network" {
  source              = "./Network"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  subnet1_name   = var.subnet1_name
  subnet1_prefix = var.subnet1_prefix

  subnet2_name   = var.subnet2_name
  subnet2_prefix = var.subnet2_prefix
}

module "compute" {
  source = "./Compute"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  vm_size        = var.vm_size
  admin_username = var.admin_username
  public_key     = var.public_key

  bastion_subnet_id = module.Network.bastion_subnet_id
  app_subnet_id     = module.Network.app_subnet_id



}