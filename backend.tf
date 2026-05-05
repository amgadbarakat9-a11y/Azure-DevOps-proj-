terraform {
  backend "azurerm" {
    resource_group_name  = "statte"
    storage_account_name = "sate22"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}