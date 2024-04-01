# 引用：https://learn.microsoft.com/ja-jp/azure/mysql/flexible-server/quickstart-create-terraform?tabs=azure-cli
resource "azurerm_mysql_flexible_server" "example" {
  name                   = var.database_server_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = var.resource_group_location
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  sku_name               = "GP_Standard_D2ds_v4"
  zone                   = "3"
}

resource "azurerm_mysql_flexible_server_firewall_rule" "example" {
  name                = "office"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.example.name
  # 「Allow access to Azure services」を有効にするため、start_ip_address と end_ip_address に 0.0.0.0 を指定します。
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_firewall_rule
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_mysql_flexible_database" "example" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.example.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
