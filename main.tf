provider "azure" {
  publish_settings = "${file("credentials.publishsettings")}"
}

resource "azure_virtual_network" "testVnet1" {
  name          = "terraform-test-vnet1"
  address_space = ["10.1.2.0/24"]
  location      = "West Europe"

  subnet {
    name           = "subnet1"
    address_prefix = "10.1.2.0/25"
  }
}

resource "azure_virtual_network" "testVnet2" {
  name          = "terraform-test-vnet2"
  location      = "West Europe"
  address_space = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
}

resource "azure_security_group" "testSecurityGroup" {
  name     = "terraform-test-security-group"
  location = "West Europe"
}
