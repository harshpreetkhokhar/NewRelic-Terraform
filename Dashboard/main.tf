# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version= "3.36.0"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
  account_id = 4438267
  api_key = "NRAK-I4B91QWK1OZEQWLE7DKQ1KEE8ZX "   # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}

module "dashboard" {
  source = "./dash"

  dashboard_name = "Example Dashboard"
  permissions    = "public_read_only"

  default_values = ["value1", "value2"]

  item = {
    title = "item_title"
    value = "item_value"
  }

  nrql_query = {
    account_ids = [4438267]
    query       = "FROM Transaction SELECT average(duration) FACET appName"
  }

  replacement_strategy = "default"
  title                = "dashboard_title"
  type                 = "nrql"
}
