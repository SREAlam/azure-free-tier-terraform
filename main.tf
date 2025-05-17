terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.99.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f0d02754-d8ca-4e7d-b010-ebac7cd463da"
}

resource "azurerm_resource_group" "free_rg" {
  name     = "free-resources-${substr(sha256(timestamp()), 0, 8)}"
  location = "westus"
}

resource "azurerm_storage_account" "free_storage" {
  name                     = "freestrg${substr(sha256(timestamp()), 0, 8)}"
  resource_group_name      = azurerm_resource_group.free_rg.name
  location                 = azurerm_resource_group.free_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "free_plan" {
  name                = "free-linux-plan"
  resource_group_name = azurerm_resource_group.free_rg.name
  location            = azurerm_resource_group.free_rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

# Add this new resource - a simple Linux web app with default page
resource "azurerm_linux_web_app" "free_app" {
  name                = "free-app-${substr(sha256(timestamp()), 0, 8)}"
  resource_group_name = azurerm_resource_group.free_rg.name
  location            = azurerm_service_plan.free_plan.location
  service_plan_id     = azurerm_service_plan.free_plan.id

  site_config {
    always_on = false # Must be false for free tier
  }

  # Simple homepage
  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}

output "web_app_url" {
  value = "https://${azurerm_linux_web_app.free_app.default_hostname}"
}