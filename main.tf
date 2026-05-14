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

  subnet3_name   = var.subnet3_name
  subnet3_prefix = var.subnet3_prefix

  subnet4_prefix = var.subnet4_prefix

  

}

module "compute" {
  source = "./Compute"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  vm_size        = var.vm_size
  admin_username = var.admin_username
  public_key     = var.public_key

  bastion_subnet_id = module.Network.bastion_subnet_id
  app_subnet1_id     = module.Network.app_subnet1_id
  app_subnet2_id     = module.Network.app_subnet2_id

  backend_pool_id = module.Network.backend_pool_id


}

module "Database" {
  source              = "./database"
  location            = var.location
  resource_group_name = var.resource_group_name
  db_subnet_id = module.Network.subnet4_id
  vnet_id      = module.Network.vnet_id

  depends_on = [
    module.Network
  ]
}