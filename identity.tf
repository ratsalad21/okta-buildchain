variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 3.14"
    }
  }
}

provider "okta" {
    org_name = var.org_name
    api_token = var.api_token
    base_url = var.base_url
}

resource "okta_user_schema_property" "dob_extension" {
    index = "date_of_birth"
    title = "Date of Birth"
    type = "string"
    master = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "crn_extension" {
    index = "customer_reference_number"
    title = "Customer Reference Number"
    type = "string"
    master = "PROFILE_MASTER"
    depends_on = [okta_user_schema_property.dob_extension]
}