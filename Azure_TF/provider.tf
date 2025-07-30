terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "5156f0c3-0314-436e-a712-5a97fe5cc0f1"
  alias = "eastus"
  location = "eastus"
  skip_provider_registration = true
  
}

provider "azurerm" {
  features {}
  alias = "westeurope"
  subscription_id = var.subscription_id
  skip_provider_registration = true
  location = "westeurope"
}




terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  }






























