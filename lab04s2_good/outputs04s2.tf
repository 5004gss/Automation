output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet1_name" {
  value = azurerm_subnet.subnet.name
}
output "subnet1_space" {
  value = azurerm_subnet.subnet.address_prefixes
}

output "subnet2_name" {
  value = azurerm_subnet.subnet2.name
}
output "subnet2_space" {
  value = azurerm_subnet.subnet2.address_prefixes
}

output "windows_hostname" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].name
}

output "windows_private_ip" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].private_ip_address
}

output "windows_public_ip" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].public_ip_address
}

output "linux_dns_name" {
  value = values(azurerm_public_ip.windows_pip)[*].fqdn
}

