variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 3.40.0"
    }
  }
}

provider "okta" {
    org_name = var.org_name
    api_token = var.api_token
    base_url = var.base_url
}
