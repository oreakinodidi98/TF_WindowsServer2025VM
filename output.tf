# Resource Group Outputs
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.resourcegroup.name
}
output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.resourcegroup.location
}
# Connection Instructions
output "connection_instructions" {
  description = "Instructions for connecting to the VM via Bastion"
  value       = <<-EOT
    To connect to your Windows Server 2025 VM:
    1. Go to the Azure Portal (https://portal.azure.com)
    2. Navigate to your VM: ${azurerm_windows_virtual_machine.main.name}
    3. Click 'Connect' → 'Bastion'
    4. Enter username: ${azurerm_windows_virtual_machine.main.admin_username}
    5. Enter the admin password you configured
    6. Click 'Connect' to open Remote Desktop session
    
    VM Private IP: ${azurerm_network_interface.main.private_ip_address}
    OS: Windows Server 2025 Datacenter (Azure Edition)
  EOT
}