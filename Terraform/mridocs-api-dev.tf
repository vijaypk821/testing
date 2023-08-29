resource "azurerm_windows_web_app" "api" {
  name                = "mridocs-api-dev"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = "1"
    WEBSITE_ENABLE_SYNC_UPDATE_SITE = "true"
  }

  site_config { 
    application_stack {
#      dotnet_version = "v3.0" #Do not uncomment as dotnet version is taking by default
      current_stack  = "dotnet"
    }
 }
}