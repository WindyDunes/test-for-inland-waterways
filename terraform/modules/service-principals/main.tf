
# Configure Terraform for azure AD
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.48.0"
    }
  }
}

data "azuread_client_config" "current" {}

# output "object_id" {
#   value = data.azurerm_azuread_client_config.current.object_id
# }

# output "tenant_id" {
#   value = data.azurerm_azuread_client_config.current.tenant_id
# }

# # Configure the Azure Active Directory Provider
# provider "azuread" {
#   tenant_id = data.azurerm_azuread_client_config.current.tenant_id
# }


# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal


# Dependencies


# Modules

# resource "azuread_application" "caci-application" {
#   display_name = "caci-devsecops-application"
# }

# resource "azuread_service_principal" "caci-sp" {
#   client_id                    = azuread_application.caci-application.id
#   app_role_assignment_required = false
#   # owners                       = [data.azuread_client_config.current.object_id]

#   feature_tags {
#     enterprise = true
#     gallery    = true
#   }
# }

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

# resource "azuread_application_password" "caci-application" {
#   application_id = azuread_application.caci-application.id
#   # value                 = random_password.password.result
#   end_date_relative     = "8760h"
# }

# # Output the Service Principal and password
# output  "app" {
# value  =  azuread_application.app.id
# sensitive  =  true
# }

# output  "app_password" {
# value  =  azuread_application_password.example.value
# sensitive  =  true
# }