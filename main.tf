terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}

# provider "azurerm" {
#     features {

#     }
#   # Configuration options
# }

locals {
  tags = {
    "Environment" = var.environment
  }
}

resource "azurerm_storage_account" "securestorage" {
  resource_group_name           = var.resource_group_name
  name                          = var.name
  location                      = var.location
  account_replication_type      = var.environment == "Production" ? "GRS" : "LRS"
  account_tier                  = "Standard"
  public_network_access_enabled = false
  tags                          = local.tags





}
