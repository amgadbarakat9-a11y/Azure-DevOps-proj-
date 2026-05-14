// subscription_id     = ""

location            = "West Europe"
resource_group_name = "rg-prod"

vm_size        = "Standard_B2s"
admin_username = "amgad"

vnet_name          = "vnet-prod"
vnet_address_space = ["10.1.0.0/16"]

subnet1_name   = "bastion-subnet"
subnet1_prefix = ["10.1.1.0/24"]

subnet2_name   = "app-subnet1"
subnet2_prefix = ["10.1.2.0/24"]

subnet3_name   = "app-subnet2"
subnet3_prefix = ["10.1.3.0/24"]

subnet4_prefix = ["10.1.4.0/24"]