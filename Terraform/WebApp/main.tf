provider "azurerm" {
  version = "=2.0.0"
  features { }  
}

resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}

resource "azurerm_app_service_plan" "app_plan" {
  name                = var.appServicePlanName
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.appServiceName
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "10.15.2"
    "WEBSITE_NODE_DEFAULT_VERSION" = "10.15.2"
    "ApiUrl" = ""	
    "ApiUrlShoppingCart" = ""	
    "MongoConnectionString" = ""	
    "SqlConnectionString" = "" 	
    "productImagesUrl" =	"https://raw.githubusercontent.com/microsoft/TailwindTraders-Backend/master/Deploy/tailwindtraders-images/product-detail"
    "Personalizer__ApiKey" = ""	
    "Personalizer__Endpoint" = ""
  }
}
