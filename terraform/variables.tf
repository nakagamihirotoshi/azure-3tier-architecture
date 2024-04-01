variable "resource_group_location" {
  type        = string
  default     = "japaneast"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureadmin"
}

variable "database_server_name" {
  type = string
  description = "The name of the database server."
  default = "cgg-2024-wellarchitected-db-sci02118"
}

variable "app_service_name" {
  type = string
  description = "The name of the app service."
  default = "cgg-2024-wellarchitected-app-sci02118"
  
}
