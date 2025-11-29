# VM Outputs
output "vm_name" {
  description = "The name of the virtual machine"
  value       = azurerm_windows_virtual_machine.main.name
}

output "vm_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_windows_virtual_machine.main.id
}

output "admin_username" {
  description = "The admin username for the VM"
  value       = azurerm_windows_virtual_machine.main.admin_username
}