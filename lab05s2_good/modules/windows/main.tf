resource "azurerm_availability_set" "avset" {
  name                         = var.windows_avset
  location                     = var.location
  resource_group_name          = var.rg_windows
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true

}

resource "azurerm_windows_virtual_machine" "vmwindows" {
  name                  = each.key
  for_each              = var.windows_name
  location              = var.location
  resource_group_name   = var.rg_windows
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  availability_set_id   = azurerm_availability_set.avset.id
  size                  = each.value
  admin_username        = var.windows_admin_user
  admin_password        = var.admin_password

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
    version   = "latest"
  }

}

resource "azurerm_network_interface" "windows_nic" {
  for_each = var.windows_name
  name     = "${each.key}-nic"

  location            = var.location
  resource_group_name = var.rg_windows

  ip_configuration {
    name                          = each.key
    subnet_id                     = var.subnet2_id
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_public_ip" "windows_pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.rg_windows
  allocation_method   = "Dynamic"
  domain_name_label   = each.key
}
