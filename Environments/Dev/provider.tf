terraform {
  required_version = ">=1.12.0"
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backend_rg_dont_delete"
    storage_account_name = "stgannuback"
    container_name       = "stgannuback"
    key                  = "todo.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f0c89d74-b3bd-42ba-acd7-d8aa4114e1ef"
}
