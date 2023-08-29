# Create the windows App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = var.azurerm_service_plan
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = "Windows"
  sku_name            = "B1"
}

# create the windows web app
resource "azurerm_windows_web_app" "webapp" {
  name                = var.azurerm_windows_web_app
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  app_settings = {
    ASPNETCORE_ENVIRONMENT = "Development"
    SettingsDBConnection = "Server=tcp:mridoc-admin-dbserver.database.windows.net,1433;Initial Catalog=ConnectDocsAdmin;Persist Security Info=False;User ID=dbserver;Password=Mrisoftware@123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
    WEBSITE_RUN_FROM_PACKAGE = "1"
    WEBSITE_ENABLE_SYNC_UPDATE_SITE = "true"
  }

  site_config {
    application_stack {
#      dotnet_version = "v3.1" #Do not uncomment as dotnet version is taking by default
      current_stack  = "dotnet"
    }
  }
}
