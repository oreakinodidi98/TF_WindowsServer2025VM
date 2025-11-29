variable "location" {
  type = string
}
variable "resourcegroup" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "vm_size" {
  type = string
}
variable "tags" {
  type = map(string)
}
variable "network_interface_id" {
  type = string
}
variable "admin_username" {
  type        = string
}
variable "admin_password" {
  type        = string
  sensitive   = true
}