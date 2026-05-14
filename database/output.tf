output "mysql_server_name" {
  value = azurerm_mysql_flexible_server.mysql.name
}

output "mysql_fqdn" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}

output "mysql_admin_username" {
  value = azurerm_mysql_flexible_server.mysql.administrator_login
}

output "database_name" {
  value = azurerm_mysql_flexible_database.appdb.name
}