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

output "linux_hostname" {
  value = azurerm_linux_virtual_machine.vmlinux[*].name
}

output "linux_private_ip" {
  value = azurerm_linux_virtual_machine.vmlinux[*].private_ip_address
}

output "linux_public_ip" {
  value = azurerm_linux_virtual_machine.vmlinux[*].public_ip_address
}

output "linux_dns_name" {
  value = azurerm_public_ip.linux_pip[*].fqdn
}

