terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2b78ef0c-c073-44bc-9a28-925fb028475e"
}

resource "azurerm_resource_group" "lab2" {
  name     = "rg-terraform-lab2"
  location = "mexicocentral"
}

# El nombre de una storage account debe ser único en todo Azure,
# así que se agrega un sufijo aleatorio
resource "random_string" "sufijo" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_storage_account" "lab2" {
  name                     = "stlab2${random_string.sufijo.result}"
  resource_group_name      = azurerm_resource_group.lab2.name
  location                 = azurerm_resource_group.lab2.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "storage_account_name" {
  value = azurerm_storage_account.lab2.name
}