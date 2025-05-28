terraform {
  backend "azurerm" {
    resource_group_name = "AZrg1011"
    storage_account_name = "storageweb1010"
    container_name = "webtfstate"
    key = "xxxx.<container_name>" #access_key = "your_access_key_here" # Uncomment and set if needed
  }
  required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "4.27.0"
    }
  }
}
provider "azurerm" {
  # Configuration options
    features {
      
    }
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
}
resource "azurerm_resource_group" "AZrg102" {
  name = "AZrg1012"
  location = "East US"
  tags = {
    "key" = "myRG1012"
  }
}
resource "azurerm_virtual_network" "AZvnet101" {
  name = "AZvnet1011"
  location = azurerm_resource_group.AZrg102.location
  resource_group_name = azurerm_resource_group.AZrg102.name
  address_space = ["10.60.0.0/16"]
  tags = {
    "key" = "Vnet101222"
  }
}