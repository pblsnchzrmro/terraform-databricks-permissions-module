variable "permissions_file" {
  description = "Path to the YAML file containing permissions configuration"
  type        = string
  default     = "permissions.yaml"
}

variable "databricks_workspace" {
  description = "Databricks workspace URL"
  type        = string
}
