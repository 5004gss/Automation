resource "azurerm_resource_group" "rg_linux" {
  name     = var.rg_linux
  location = var.location
}
resource "azurerm_resource_group" "rg_network" {
  name     = var.rg_network
  location = var.location
}
resource "azurerm_resource_group" "rg_windows" {
  name     = var.rg_windows
  location = var.location
}

