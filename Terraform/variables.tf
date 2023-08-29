variable "resource_group_location" {
  default     = "eastus"
  description = "Location for all resource"
}

variable "resource_group_name" {
 default = "rg-eastus-documentservice-sandbox"
 description = "Name of the resource group"
}

variable "azurerm_service_plan" {
  default = "mridocs-appserviceplan-DEV"
  description = "name of the app service plan"
}

variable "azurerm_windows_web_app" {
  default = "mridocs-admin-dev"
  description = "name of the webapp"
}