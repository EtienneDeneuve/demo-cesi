resource "azurerm_linux_virtual_machine" "vm1" {
  name                  = var.vm_name
  
  resource_group_name   = data.azurerm_resource_group.rg.name
  location              = data.azurerm_resource_group.rg.location
  size                  = "Standard_B1ms"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = var.nic_id_array

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }
}
