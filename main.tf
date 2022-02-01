# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.naming
  location = "West Europe"
}

# un vm

# une carte reseau
resource "azurerm_network_interface" "nic" {
  name                = format("%s-nic", var.naming)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.back.id
    private_ip_address_allocation = "Dynamic"
  }
}
# d'un disque eventuel

# ip public


