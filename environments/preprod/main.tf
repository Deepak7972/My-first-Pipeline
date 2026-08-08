module "resource_group" {
  source   = "../../modules/azurerm_resource_group"
  resource = var.resource
}

module "virtual_network" {
  depends_on      = [module.resource_group]
  source          = "../../modules/azurerm_virtual_network"
  virtual_network = var.vnet
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  subnet     = var.subnet
}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  publicip   = var.publicip
}
module "virtual_machine" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
}

module "key_vault" {
  source    = "../../modules/azurerm_key_vault"
  key_vault = var.key_vault
}


