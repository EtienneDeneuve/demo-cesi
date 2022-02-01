# une carte reseau
resource "azurerm_network_interface" "nic" {
  count               = var.numberofVm
  name                = format("%s%d", var.vm_name, count.index + 1)
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.pip.*.id, count.index)
  }
}

resource "azurerm_public_ip" "pip" {
  count               = var.numberofVm
  name                = format("%s%d", var.vm_name, count.index + 1)
  allocation_method   = "Dynamic"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

}
