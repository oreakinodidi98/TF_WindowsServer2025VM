variable "vnet_name" {
  type = string
}
variable "bastion_name" {
  type = string
}
variable "location" {
  type = string
}
variable "resourcegroup" {
  type = string
}
variable "address_space" {
  type = list(string)
}
variable "vm_subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}
variable "bastion_subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}
variable "vm_subnet_name" {
  type = string
}
variable "bastion_subnet_name" {
  type = string
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
variable "bastion_public_ip_name" {
  type = string
}
variable "bastion_public_ip" {
  description = "Settings for the bastion's IP settings (e.g. name, allocation)"
}
variable "network_interface_name" {
  type = string
}
