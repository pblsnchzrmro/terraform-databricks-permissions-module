locals {
  raw_tables        = lookup(var.config, "tables", [])
  filtered_tables   = [for t in local.raw_tables : t if t != null]
  table_permissions = { for k in local.filtered_tables : "${k.catalog_name}.${k.schema_name}.${k.name}" => k if lookup(k, "catalog_name", null) != null && lookup(k, "schema_name", null) != null && lookup(k, "name", null) != null }
}

resource "databricks_grants" "table_permissions" {
  for_each = { for k, v in local.table_permissions : k => v if lookup(v, "grants", null) != null }

  table = each.key

  dynamic "grant" {
    for_each = { for k in lookup(each.value, "grants", []) : k.principal => k.privileges if k != null && lookup(k, "principal", null) != null }
    content {
      principal  = grant.key
      privileges = grant.value
    }
  }
}
