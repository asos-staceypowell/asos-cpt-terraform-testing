provider "azure" {
  publish_settings = "${file("credentials.publishsettings")}"
}

resource "azure_virtual_network" "testVnet" {
  name          = "terraform-test-vnet"
  address_space = ["10.1.2.0/24"]
  location      = "West Europe"

  subnet {
    name           = "subnet1"
    address_prefix = "10.1.2.0/25"
  }
}

resource "azurerm_resource_group" "testRg" {
  name     = "terraform-Vnet-Test-Rg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "testVnet2" {
  name                = "terraform-test-vnet2"
  location            = "West Europe"
  resource_group_name = "terraform-Vnet-Test-Rg"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
  }
}
