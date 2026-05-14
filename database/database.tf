resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "amgad-mysql-server"
  resource_group_name    = var.resource_group_name
  location               = var.location

  administrator_login    = "amgad"
  administrator_password = "Amgad@123456"

  sku_name               = "B_Standard_B1ms"
  version                = "8.0.21"

  delegated_subnet_id    = var.db_subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.mysql_dns.id

  storage {
    size_gb = 20
  }

  backup_retention_days = 7

  depends_on = [azurerm_private_dns_zone_virtual_network_link.mysql_link]  # ← ده الجديد
}



resource "azurerm_private_dns_zone" "mysql_dns" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = var.resource_group_name
}


resource "azurerm_private_dns_zone_virtual_network_link" "mysql_link" {
  name                  = "mysql-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.mysql_dns.name

  virtual_network_id    = var.vnet_id
}

resource "azurerm_mysql_flexible_database" "appdb" {
  name                = "appdb"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name

  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}


