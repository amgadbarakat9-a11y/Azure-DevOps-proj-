resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "public_lb" {
  name                = "public-loadbalancer"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "public-frontend"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.public_lb.id
  name            = "backend-pool"
}

resource "azurerm_lb_probe" "app_probe" {
  loadbalancer_id = azurerm_lb.public_lb.id
  name            = "app-probe"
  port            = 3000
  protocol        = "Tcp"
}

resource "azurerm_lb_rule" "app_rule" {
  loadbalancer_id                = azurerm_lb.public_lb.id
  name                           = "app-rule"
  protocol                       = "Tcp"

  frontend_port                  = 3000
  backend_port                   = 3000

  frontend_ip_configuration_name = "public-frontend"

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.backend_pool.id
  ]

  probe_id = azurerm_lb_probe.app_probe.id
}