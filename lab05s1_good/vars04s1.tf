locals {
  common_tags = {
    Name         = "Terraform Class"
    Project      = "Learning"
    ContactEmail = "first.last@email.com"
    Environment  = "Lab"
  }
}

variable "priv_key" {
  default = "/home/devopsadm/.ssh/id_rsa"
}

variable "nb_count" {
  default = "1"
}

variable "linux_avs" {
  default = "linux_avs"
}

variable "linux_name" {
  default = "lab-db1-u-vm"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "linux_admin_user" {
  default = "devopsadm"
}

variable "pub_key" {
  default = "/home/devopsadm/.ssh/id_rsa.pub"
}

variable "los_disk_attr" {
  type = map(string)
  default = {
    los_storage_account_type = "Premium_LRS"
    los_disk_size            = "32"
    los_disk_caching         = "ReadWrite"
  }
}

variable "linux_publisher" {
  default = "Canonical"
}
variable "linux_offer" {
  default = "UbuntuServer"
}
variable "linux_sku" {
  default = "19.04"
}
variable "linux_version" {
  default = "latest"
}
