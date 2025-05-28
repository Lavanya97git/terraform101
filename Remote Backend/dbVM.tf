resource "azurerm_subnet" AZdbsubnet101 {
  name = "dbsubnet1011"
  resource_group_name = azurerm_resource_group.AZrg102.name
  virtual_network_name = azurerm_virtual_network.AZvnet101.name
  address_prefixes = ["10.60.3.0/24"]
}
resource "azurerm_public_ip" "AZdbpublicip101" {
  name = "AZdbpublicip1011"
  location = azurerm_resource_group.AZrg102.location
  resource_group_name = azurerm_resource_group.AZrg102.name
  allocation_method = "Static"
  
}
resource "azurerm_network_interface" "AZdbnic101" {
  name = "AZdbnic1011"
  location = azurerm_resource_group.AZrg102.location
  resource_group_name = azurerm_resource_group.AZrg102.name
  ip_configuration {
    name = "dbipconfig1011"
    subnet_id = azurerm_subnet.AZdbsubnet101.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.AZdbpublicip101.id
  }
}
resource "azurerm_linux_virtual_machine" "AZdbVM101" {
  name = "AZdbVM1011"
  location = azurerm_resource_group.AZrg102.location
  resource_group_name = azurerm_resource_group.AZrg102.name
  size = "Standard_B1s"
  admin_username = "admindbuser"
  network_interface_ids = [azurerm_network_interface.AZdbnic101.id,]
  admin_ssh_key {
    username = "admindbuser"
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