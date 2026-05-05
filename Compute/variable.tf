variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vm_size" {
  description = "Virtual machine size"
  type        = string
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}

variable "bastion_subnet_id" {
  description = "Subnet ID for bastion VM"
  type        = string
}

variable "app_subnet_id" {
  description = "Subnet ID for app VM"
  type        = string
}



