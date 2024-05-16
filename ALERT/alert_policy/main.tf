# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version= "3.3.0"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
  account_id = 4438267
  api_key = "NRAK-I4B91QWK1OZEQWLE7DKQ1KEE8ZX "   # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}

resource "newrelic_alert_policy" "alert01" {
  name = "alert-Terraform"
  incident_preference = var.incident_preference
  }
