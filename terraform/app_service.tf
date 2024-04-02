resource "azurerm_service_plan" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "example" {
  name                      = var.app_service_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_service_plan.example.location
  service_plan_id           = azurerm_service_plan.example.id
  virtual_network_subnet_id = azurerm_subnet.app-subnet.id

  # バックアップ設定
  backup {
    name = "exampleBackup"
    schedule {
      # バックアップ頻度
      frequency_interval = 1
      # バックアップ頻度の単位
      frequency_unit     = "Day"
      # バックアップを最低1つ保持するかどうか
      keep_at_least_one_backup = true
      # バックアップを保持する日数
      retention_period_days = 30
    }
    storage_account_url = azurerm_storage_account.appservice_backapp.primary_blob_endpoint
  }
  site_config {
    application_stack {
      docker_image_name = "wordpress"
    }
  }
}
