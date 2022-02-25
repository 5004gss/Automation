resource "azurerm_availability_set" "avset" {
  name                         = var.windows_avs
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"

}

resource "azurerm_windows_virtual_machine" "vmwindows" {
  for_each              = var.windows_name
  name                  = each.key
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  computer_name         = each.key
  size                  = each.value
  admin_username        = var.windows_admin_user
  admin_password        = "P@ssw0rd!2345"
  tags                  = local.common_tags
  availability_set_id   = azurerm_availability_set.avset.id
  depends_on            = [azurerm_availability_set.avset]

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.wos_disk_attr["wos_disk_caching"]
    storage_account_type = var.wos_disk_attr["wos_storage_account_type"]
    disk_size_gb         = var.wos_disk_attr["wos_disk_size"]
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }
  winrm_listener {
    protocol = "Http"
  }

}

resource "azurerm_network_interface" "windows_nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  depends_on          = [azurerm_subnet_network_security_group_association.subnet_association2]
  tags                = local.common_tags

  ip_configuration {
    name                          = each.key
    subnet_id                     = azurerm_subnet.subnet2.id
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "windows_pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
domain_name_label = each.key
  tags                = local.common_tags
}

