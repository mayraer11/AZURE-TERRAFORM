terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "demosmayraespinoza"

    workspaces {
      name = "Microsoft-Ignite"
    }
  }
}

resource "azurerm_resource_group" "rgazuredevops" {
  name     = "rgazuredevops"
  location = "eastus"
}

resource "azurerm_storage_account" "saazuredevops" {
  name                     = "saazuredevops03082019btc"
  resource_group_name      = azurerm_resource_group.rgazuredevops.name
  location                 = azurerm_resource_group.rgazuredevops.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "scazuredevops" {
   name = "scazuredevops"
   storage_account_name = azurerm_storage_account.saazuredevops.name
   container_access_type = "blob"
}