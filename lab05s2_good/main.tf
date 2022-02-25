module "resource_group" {
  source     = "./modules/resource_group"
  rg_network = "Network-RG"
  rg_windows = "Windows-RG"
  rg_linux   = "Linux-RG"
  location   = "Canada East"
}

module "network" {
  source         = "./modules/network"
  rg_network     = "Network-RG"
  resource_group = module.resource_group.rg_network.name
  location       = module.resource_group.rg_network.location
  vnet           = "vnet1"
  vnet_space     = ["10.0.0.0/16"]
  subnet1        = "subnet1"
  subnet1_space  = ["10.0.1.0/24"]
  subnet2        = "subnet2"
  subnet2_space  = ["10.0.2.0/24"]
  nsg1           = "nsg1"
  nsg2           = "nsg2"
}

module "linux" {
  source         = "./modules/linux"
  rg_linux       = "Linux-RG"
  linux_name     = "terraform-u-vm"
  linux_avset    = "linux-avs"
  nb_count       = 2
  location       = module.resource_group.rg_linux.location
  resource_group = module.resource_group.rg_linux.name
  subnet1_id     = module.network.subnet1_id
  depends_on     = [module.network]
}

module "windows" {
  source     = "./modules/windows"
  rg_windows = "Windows-RG"

  windows_avset = "windows-avs"
  windows_name = {
    terraform-w-vm1 = "Standard_B1s"
    terraform-w-vm2 = "Standard_B1ms"
  }
  location       = module.resource_group.rg_windows.location
  resource_group = module.resource_group.rg_windows.name
  subnet2_id     = module.network.subnet2_id
  depends_on     = [module.network]
}
