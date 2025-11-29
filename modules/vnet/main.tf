# Virtual Network
resource "azurerm_virtual_network" "main" {
    name                = var.vnet_name
    address_space       = var.address_space
    location            = var.location
    resource_group_name = var.resourcegroup

    tags = var.tags
}
# Subnet for VMs
resource "azurerm_subnet" "vm" {
    name                 = var.vm_subnet_name
    resource_group_name  = var.resourcegroup
    virtual_network_name = azurerm_virtual_network.main.name
    address_prefixes     = var.vm_subnet_address_prefixes
}
# Azure Bastion Subnet (must be named exactly "AzureBastionSubnet")
resource "azurerm_subnet" "bastion" {
    name                 = var.bastion_subnet_name
    resource_group_name  = var.resourcegroup
    virtual_network_name = azurerm_virtual_network.main.name
    address_prefixes     = var.bastion_subnet_address_prefixes
}
# Public IP for Bastion
resource "azurerm_public_ip" "bastion" {
    name                         = var.bastion_public_ip_name
    location                     = var.location
    resource_group_name          = var.resourcegroup
    allocation_method            = var.bastion_public_ip
    sku                         = "Standard"

    tags = var.tags
}
# Azure Bastion Host
resource "azurerm_bastion_host" "main" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resourcegroup
  sku                 = "Basic"

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion.id
  }

  tags = var.tags
}
# Network interface for VMs
resource "azurerm_network_interface" "main" {
    name                = var.network_interface_name
    location            = var.location
    resource_group_name = var.resourcegroup

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.vm.id
        private_ip_address_allocation = "Dynamic"
    }

    tags = var.tags
}