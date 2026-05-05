// subscription_id     = ""

location            = "uaenorth"
resource_group_name = "rg-dev"

vm_size        = "Standard_B2as_v2"
admin_username = "amgad"

vnet_name          = "vnet-dev"
vnet_address_space = ["10.0.0.0/16"]

subnet1_name   = "bastion-subnet"
subnet1_prefix = ["10.0.1.0/24"]

subnet2_name   = "app-subnet"
subnet2_prefix = ["10.0.2.0/24"]