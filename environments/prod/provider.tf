terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg1"
    storage_account_name = "mystorage193"
    container_name       = "root-state"
    key                  = "tfstate"
  }
}

provider "azurerm" {
  features {}
}