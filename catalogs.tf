locals {
  raw_catalogs        = lookup(var.config, "catalogs", [])
  filtered_catalogs   = [for c in local.raw_catalogs : c if c != null]
  catalog_permissions = { for k in local.filtered_catalogs : k.name => k if lookup(k, "name", null) != null }
}

resource "databricks_grants" "catalog_permissions" {
  for_each = { for k, v in local.catalog_permissions : k => v if lookup(v, "grants", null) != null }

  catalog = each.key

  dynamic "grant" {
    for_each = { for k in lookup(each.value, "grants", []) : k.principal => k.privileges if k != null && lookup(k, "principal", null) != null }
    content {
      principal  = grant.key
      privileges = grant.value
    }
  }
}
