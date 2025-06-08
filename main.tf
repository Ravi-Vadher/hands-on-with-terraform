terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {

    organization = "RV-Test-2025"

    workspaces {
      name = "hands-on-with-terraform"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-c2ea7d75-hands-on-with-terraform-on-azure"
  location = "southcentralus"
}

module "securestorage" {
  source               = "app.terraform.io/RV-Test-2025/securestorage/azurerm"
  version              = "1.0.1"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "rcsaistg883456"
}
