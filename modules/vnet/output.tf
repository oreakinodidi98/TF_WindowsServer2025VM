output "network_interface_id" {
  value = azurerm_network_interface.main.id
}
output "vm_private_ip" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.main.private_ip_address
}
# Network Outputs
output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.main.name
}

output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.main.id
}

output "vm_subnet_id" {
  description = "The ID of the VM subnet"
  value       = azurerm_subnet.vm.id
}

output "bastion_subnet_id" {
  description = "The ID of the Bastion subnet"
  value       = azurerm_subnet.bastion.id
}
# Bastion Outputs
output "bastion_name" {
  description = "The name of the Azure Bastion host"
  value       = azurerm_bastion_host.main.name
}

output "bastion_public_ip" {
  description = "The public IP address of the Bastion host"
  value       = azurerm_public_ip.bastion.ip_address
}