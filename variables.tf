# Default variables 
variable "resourcegroup" {
  description = "value for resourcegroup"
  type        = string
  default     = "tf_vm_bastion"
}
variable "location" {
  description = "value for location"
  type        = string
  default     = "UK South"
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    owner       = "Ore"
    environment = "VM Terraform"
  }
}
variable "environment" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
  default     = "dev"
}
#################### VNET Variables ####################
variable "vnet_name" {
  type    = string
  default = "TFVNet"
}
variable "bastion_name" {
  type    = string
  default = "TFbastion"
}
variable "address_space" {
  description = "The address space for the vn-net"
  type        = list(string)
  default     = ["10.0.1.0/16"]
}
#################### Subnet Variables ####################
variable "vm_subnet_name" {
  type    = string
  default = "snetVM"
}
variable "bastion_subnet_name" {
  type    = string
  default = "AzureBastionSubnet"
}
variable "vm_subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
variable "bastion_subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.2.0/26"]
}
#################### Public IP Variables ####################
variable "bastion_public_ip" {
  description = "Settings for the VM's IP settings (e.g. allocation)"
  type        = string
  default     = "Static"
}
variable "bastion_public_ip_name" {
  type    = string
  default = "pipBastionTF"
}
#################### Network Interface Variables ####################
variable "network_interface_name" {
  type    = string
  default = "TFnetworkinterface"
}
#################### VM Variables ####################
variable "vm_name" {
  type    = string
  default = "WTHUbuntuVM01"
}
variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"
}
variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureadmin"
}
variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive   = true
}