
terraform {
  required_version = ">= 1.0" 
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.53.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

# Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformaksdevops"
    container_name        = "tfstatefiles"
    key                   = "dev.terraform.tfstate"
  }  
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "random_pet" "aksrandom" {

}