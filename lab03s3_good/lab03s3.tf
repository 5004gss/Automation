resource "azurerm_linux_virtual_machine" "vmlinux" {
  name                  = "${var.linux_name}-vm"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.linux_nic.id]
  computer_name         = var.linux_name
  size                  = var.vm_size
  admin_username        = var.linux_admin_user
  tags                  = local.common_tags

  admin_ssh_key {
    username   = var.linux_admin_user
    public_key = file(var.pub_key)
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk"
    caching              = var.los_disk_attr["los_disk_caching"]
    storage_account_type = var.los_disk_attr["los_storage_account_type"]
    disk_size_gb         = var.los_disk_attr["los_disk_size"]
  }

  source_image_reference {
    publisher = var.linux_publisher
    offer     = var.linux_offer
    sku       = var.linux_sku
    version   = var.linux_version
  }

}

resource "azurerm_network_interface" "linux_nic" {
  name = "${var.linux_name}-nic"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
depends_on = [azurerm_subnet_network_security_group_association.subnet_association]
  tags                  = local.common_tags

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig"
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = azurerm_public_ip.linux_pip.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "linux_pip" {
  name                = "${var.linux_name}-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
domain_name_label = "${var.linux_name}-vm"

  tags                  = local.common_tags
}

