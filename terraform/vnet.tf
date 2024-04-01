# # 参考：https://www.softbanktech.co.jp/special/blog/cloud_blog/2023/0036/

# # Create a virtual network
# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   tags = {
#     environment = "Developent"
#   }
# }

# # Create subnet
# resource "azurerm_subnet" "app-subnet" {
#   name                 = "app-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# resource "azurerm_subnet" "db-subnet" {
#   name                 = "db-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# # Create private DNS zone
# resource "azurerm_private_dns_zone" "example" {
#   name                = "cgg-2024-wellarchitected-db-sci02118.mysql.database.azure.com"
#   resource_group_name = azurerm_resource_group.rg.name
# }