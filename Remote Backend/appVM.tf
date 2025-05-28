resource "azurerm_subnet" AZappsubnet101 {
  name = "appsubnet1011"
  resource_group_name = azurerm_resource_group.AZrg102.name
  virtual_network_name = azurerm_virtual_network.AZvnet101.name
  address_prefixes = ["10.60.2.0/24"]
}
resource "azurerm_public_ip" "AZapppublicip101" {
  name = "AZapppublicip1011"
  location = azurerm_resource_group.AZrg102.location
  resource_group_name = azurerm_resource_group.AZrg102.name
  allocation_method = "Static"
  
}
resource "azurerm_network_interface" "AZappnic101" {
  name = "AZappnic1011"
  location = azurerm_resource_group.AZrg102.location
  resource_group_name = azurerm_resource_group.AZrg102.name
  ip_configuration {
    name = "appipconfig1011"
    subnet_id = azurerm_subnet.AZappsubnet101.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.AZapppublicip101.id
  }
}
resource "azurerm_linux_virtual_machine" "AZappVM101" {
  name = "AZappVM1011"
  location = azurerm_resource_group.AZrg102.location
  resource_group_name = azurerm_resource_group.AZrg102.name
  size = "Standard_B1s"
  admin_username = "adminappuser"
  network_interface_ids = [azurerm_network_interface.AZappnic101.id,]
  admin_ssh_key {
    username = "adminappuser"
    public_key = file("~/.ssh/id_ed25519.pub")
  }
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
}