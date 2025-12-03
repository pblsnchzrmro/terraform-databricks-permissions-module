locals {
  config = yamldecode(file(var.permissions_file))
}

module "permissions" {
  source = "../../"

  config               = local.config
  databricks_workspace = var.databricks_workspace
}
