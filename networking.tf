# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = var.naming
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

# subnet 1
resource "azurerm_subnet" "front" {
  name                 = format("%s-front", var.naming)
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

# subnet 2
resource "azurerm_subnet" "back" {
  name                 = format("%s-back", var.naming)
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# ip public
