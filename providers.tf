terraform {
  required_version = "1.2.2"
  backend "azurerm" {

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
