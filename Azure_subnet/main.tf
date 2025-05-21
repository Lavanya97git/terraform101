terraform {
  required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "4.27.0"
    }
  }
}
provider "azurerm" {   # Configuration options
    resource_provider_registrations = "none"
    features {
      
    }
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
}
resource "azurerm_resource_group" "AZrg101" {
  name = "AZrg1011"
  location = "East US"
  tags = {
    "key" = "myRG1011"
  }
}
resource "azurerm_virtual_network" "AZvnet101" {
  name = "AZvnet1011"
  location = azurerm_resource_group.AZrg101.location
  resource_group_name = azurerm_resource_group.AZrg101.name
  address_space = ["10.60.0.0/16"]
  tags = {
    "key" = "myVnet1011"
  }
}
resource "azurerm_subnet" AZwebsubnet101 {
  name = "websubnet1011"
  resource_group_name = azurerm_resource_group.AZrg101.name
  virtual_network_name = azurerm_virtual_network.AZvnet101.name
  address_prefixes = ["10.60.1.0/24"]
}
resource "azurerm_subnet" AZappsubnet101 {
  name = "appsubnet1011"
  resource_group_name = azurerm_resource_group.AZrg101.name
  virtual_network_name = azurerm_virtual_network.AZvnet101.name
  address_prefixes = ["10.60.2.0/24"]
}
resource "azurerm_subnet" AZdbsubnet101 {
  name = "dbsubnet1011"
  resource_group_name = azurerm_resource_group.AZrg101.name
  virtual_network_name = azurerm_virtual_network.AZvnet101.name
  address_prefixes = ["10.60.3.0/24"]
}
