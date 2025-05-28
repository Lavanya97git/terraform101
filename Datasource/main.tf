terraform {
  backend "azurerm" {
    resource_group_name = "AZrg1011"
    storage_account_name = "storageweb1010"
    container_name = "qatfstate" #key&acccesskey required
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
data "azurerm_resource_group" "AZrg101" {
  name = "AZrg1011"
}
data "azurerm_virtual_network" "AZvnet101" {
  name = "AZvnet1011"
  resource_group_name = data.azurerm_resource_group.AZrg101.name
}
resource "azurerm_subnet" "AZwebsubnet102" {
    name = "websubnet1021"
    resource_group_name = data.azurerm_resource_group.AZrg101.name
    virtual_network_name = data.azurerm_virtual_network.AZvnet101.name
    address_prefixes = ["10.60.4.0/24"]

}
output "virtual_network_id" {
  value = data.azurerm_virtual_network.AZvnet101.id
}
output "subnet_address" {
  value = azurerm_subnet.AZwebsubnet102.address_prefixes
}