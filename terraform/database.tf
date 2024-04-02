# 引用：https://learn.microsoft.com/ja-jp/azure/mysql/flexible-server/quickstart-create-terraform?tabs=azure-cli
resource "azurerm_mysql_flexible_server" "example" {
  name                   = var.database_server_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = var.resource_group_location
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  delegated_subnet_id    = azurerm_subnet.db-subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.example.id
  sku_name               = "GP_Standard_D2ds_v4"

  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]
}

resource "azurerm_mysql_flexible_database" "example" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.example.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
