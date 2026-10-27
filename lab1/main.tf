terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2b78ef0c-c073-44bc-9a28-925fb028475e"
}

resource "azurerm_resource_group" "lab1" {
  name     = "rg-terraform-lab1"
  location = "mexicocentral"
}