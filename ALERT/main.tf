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

module "alert_policy" {
  source = "./alert_policy"
  incident_preference = "PER_POLICY"
}


module "newrelic_nrql_alert_condition" {
  source = "./newrelic_nrql_alert_condition"
  policy_id                      = module.alert_policy.policy
}