# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.naming
  location = "West Europe"
}

module "vm1" {
  source         = "./vms"
  vm_name        = "vm1"
  admin_username = "adminuser"
  admin_password = "P@ssword1234!"
  subnet_id      = azurerm_subnet.sn3["front"].id
  rg_name        = azurerm_resource_group.rg.name
  numberofVm     = 2
  #subnet_id      = azurerm_subnet.front.id
}
