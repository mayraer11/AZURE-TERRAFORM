terraform {
  backend "azurerm" {
    storage_account_name  = "saazuredevops03082019103"
    container_name        = "scazuredevops"
    key                   = "terraformAzure.tfstate"
  }
}

resource "azurerm_resource_group" "rgazuredevops" {
  name     = "rgazuredevopsbaz"
  location = "eastus"
}

resource "azurerm_storage_account" "saazuredevops" {
  name                     = "saazuredevops03082019baz"
  resource_group_name      = azurerm_resource_group.rgazuredevops.name
  location                 = azurerm_resource_group.rgazuredevops.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "scazuredevops" {
   name = "scazuredevopsbaz"
   storage_account_name = azurerm_storage_account.saazuredevops.name
   container_access_type = "blob"
}