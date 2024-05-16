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

resource "newrelic_one_dashboard" "exampledash" {
  name        = var.dashboard_name
  permissions = var.permissions

  page {
    name = var.dashboard_name

    widget_billboard {
      title  = "Requests per minute"
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = "FROM Transaction SELECT rate(count(*), 1 minute)"
      }
    }

    widget_bar {
      title  = "Average transaction duration, by application"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = 4438267
        query      = "FROM Transaction SELECT average(duration) FACET appName"
      }

      linked_entity_guids = ["NDQzODI2N3xWSVp8REFTSEJPQVJEfGRhOjU5Njg1MTU"]
    }

    # Define other widgets here...

    widget_markdown {
      title  = "Dashboard Note"
      row    = 7
      column = 1
      width  = 12
      height = 3

      text = "### Helpful Links\n\n* [New Relic One](https://one.newrelic.com)\n* [Developer Portal](https://developer.newrelic.com)"
    }

    # Define other widgets here...
  }

  variable {
    default_values     = var.default_values
    is_multi_selection = true
    item {
      title = var.item.title
      value = var.item.value
    }
    name = var.title
    nrql_query {
      account_ids = var.nrql_query.account_ids
      query       = var.nrql_query.query
    }
    replacement_strategy = var.replacement_strategy
    title                = var.title
    type                 = var.type
  }
}