resource "azurerm_resource_group" "lab5" {
  name     = "rg-terraform-lab5"
  location = var.location
}

resource "azurerm_virtual_network" "lab5" {
  name                = "vnet-lab5"
  location            = azurerm_resource_group.lab5.location
  resource_group_name = azurerm_resource_group.lab5.name
  address_space       = [var.vnet_cidr]
}

resource "azurerm_subnet" "lab5" {
  for_each = var.subnets

  name                 = "snet-${each.key}"
  resource_group_name  = azurerm_resource_group.lab5.name
  virtual_network_name = azurerm_virtual_network.lab5.name
  address_prefixes     = [cidrsubnet(var.vnet_cidr, 8, each.value)]
}