variable "rg" {
  default = "lab02-rg"
}

variable "location" {
  default = "Canada East"
}

variable "vnet" {
  default = "lab02-vnet"
}

variable "vnet_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  default = "lab02-subnet1"
}

variable "subnet2" {
  default = "lab02-subnet2"
}

variable "subnet_space" {
  default = ["10.0.1.0/24"]
}

variable "subnet_space2" {
  default = ["10.0.2.0/24"]
}

variable "nsg" {
  default = "lab02-nsg1"
}

variable "nsg2" {
  default = "lab02-nsg2"
}