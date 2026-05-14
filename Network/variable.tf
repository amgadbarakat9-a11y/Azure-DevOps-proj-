variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "subnet1_name" {
  description = "Bastion subnet name"
  type        = string
}

variable "subnet1_prefix" {
  description = "Bastion subnet CIDR"
  type        = list(string)
}

variable "subnet2_name" {
  description = "App subnet name"
  type        = string
}

variable "subnet2_prefix" {
  description = "App subnet CIDR"
  type        = list(string)
}

variable "subnet3_name" {
  description = "App subnet name"
  type        = string
}

variable "subnet3_prefix" {
  description = "App subnet CIDR"
  type        = list(string)
}

variable "subnet4_prefix" {
  description = "App subnet CIDR"
  type        = list(string)
}