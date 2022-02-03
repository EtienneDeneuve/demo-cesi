# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "AZURE-TERRAFORM-STATE"
    storage_account_name = "azureterraformstate"
    container_name       = "tfstate"
    key                  = "prod.terraform.blog.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
