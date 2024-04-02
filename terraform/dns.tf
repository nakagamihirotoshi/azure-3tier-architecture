# Create private DNS zone
# 命名規則はサービスごとに決まっているので、ドキュメントを参照してください。
# https://learn.microsoft.com/ja-jp/azure/private-link/private-endpoint-dns#virtual-network-and-on-premises-workloads-using-a-dns-forwarder
resource "azurerm_private_dns_zone" "example" {
  name                = "ccc-2024-wellarchitected-db-sci02118.privatelink.mysql.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

# 
resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "exampleVnetZoneLink"
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = azurerm_virtual_network.example.id
  resource_group_name   = azurerm_resource_group.rg.name
}