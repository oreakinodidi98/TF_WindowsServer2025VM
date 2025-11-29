locals {
  tags = {
    environment = "demo"
    ManagedBy   = "Ore"
    workshop    = "vm_bastion"
  }
}
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.resourcegroup.name
  }

  byte_length = 8
}
resource "azurerm_resource_group" "resourcegroup" {
  name     = var.resourcegroup
  location = var.location
  tags     = local.tags
}

module "vnet" {
  source                          = "./modules/vnet"
  vnet_name                       = var.vnet_name
  bastion_name                    = var.bastion_name
  location                        = var.location
  resourcegroup                   = azurerm_resource_group.resourcegroup.name
  address_space                   = var.address_space
  vm_subnet_address_prefixes      = var.vm_subnet_address_prefixes
  vm_subnet_name                  = var.vm_subnet_name
  bastion_subnet_address_prefixes = var.bastion_subnet_address_prefixes
  bastion_subnet_name             = var.bastion_subnet_name
  tags                            = var.tags
  bastion_public_ip_name          = var.bastion_public_ip_name
  bastion_public_ip               = var.bastion_public_ip
  network_interface_name          = var.network_interface_name
}
module "vm" {
  source               = "./modules/vm"
  vm_name              = var.vm_name
  location             = var.location
  resourcegroup        = azurerm_resource_group.resourcegroup.name
  vm_size              = var.vm_size
  tags                 = var.tags
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  network_interface_id = module.vnet.network_interface_id
}