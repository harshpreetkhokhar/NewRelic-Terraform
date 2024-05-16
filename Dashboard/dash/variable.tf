variable "dashboard_name" {
  description = "The name of the New Relic dashboard"
  type        = string
}

variable "permissions" {
  description = "The permissions for the dashboard"
  type        = string
}

variable "default_values" {
  description = "Default values for the dashboard"
  type        = list(string)
}

variable "item" {
  description = "Item configuration for the dashboard"
  type        = object({
    title = string
    value = string
  })
}

variable "nrql_query" {
  description = "NRQL query configuration for the dashboard"
  type        = object({
    account_ids = list(number)
    query       = string
  })
}

variable "replacement_strategy" {
  description = "Replacement strategy for the dashboard"
  type        = string
}

variable "title" {
  description = "Title for the dashboard"
  type        = string
}

variable "type" {
  description = "Type of the dashboard"
  type        = string
}