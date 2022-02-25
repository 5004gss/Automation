locals {
  common_tags = {
    Name         = "Terraform Class"
    Project      = "Learning"
    ContactEmail = "first.last@email.com"
    Environment  = "Lab"
  }
}

variable "nb_count" {
  default = "2"
}

variable "windows_avs" {
  default = "windows_avs"
}

variable "windows_name" {
  default = {
    lab-db1-w-vm1 = "Standard_B1s"
    lab-db1-w-vm2 = "Standard_B1ms"
  }
}

variable "windows_admin_user" {
  default = "winadm"
}

variable "wos_disk_attr" {
  type = map(string)
  default = {
    wos_storage_account_type = "StandardSSD_LRS"
    wos_disk_size            = "128"
    wos_disk_caching         = "ReadWrite"
  }
}

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}
variable "windows_offer" {
  default = "WindowsServer"
}
variable "windows_sku" {
  default = "2016-Datacenter"
}
variable "windows_version" {
  default = "latest"
}
