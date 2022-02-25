variable "priv_key" {
  default = "/home/devopsadm/.ssh/id_rsa"
}

variable "location" {}
variable "rg_linux" {}
variable "resource_group" {}
variable "linux_name" {}
variable "subnet1_id" {}
variable "nb_count" {}
variable "linux_avset" {}
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

# Variables for marketplace OS image to be installed in the VMs. Run "az vm image list --all | grep -i <ubuntu|sles|windows|rhel|centos> os.out". Review os.out and find publisher, offer, sku, and version information and set the variables.

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

