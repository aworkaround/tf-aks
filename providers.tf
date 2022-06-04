terraform {
  required_version = "1.2.2"
  backend "azurerm" {
    resource_group_name  = "cloudshell"
    storage_account_name = "cloudshell934"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
  required_providers {
    azurerm = {
      version = ">= 3.9.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}
