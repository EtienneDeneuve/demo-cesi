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

resource "azurerm_subnet" "sn3" {
  for_each             = { for subnet in var.subnet_prefixes : subnet.name => subnet }
  name                 = format("%s-%s", var.naming, each.value.name)
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes
}

variable "subnet_names" {
  default = ["front", "back"]
  type    = list(any)
}

variable "subnet_prefixes" {
  default = [{
    name             = "front"
    address_prefixes = ["10.0.0.0/24"]
    },
    {
      name             = "back"
      address_prefixes = ["10.0.1.0/24"]
    }
  ]
  type = list(object({ name = string, address_prefixes = list(any) }))

}
