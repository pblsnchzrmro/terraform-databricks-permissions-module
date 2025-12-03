locals {
  raw_schemas        = lookup(var.config, "schemas", [])
  filtered_schemas   = [for s in local.raw_schemas : s if s != null]
  schema_permissions = { for k in local.filtered_schemas : "${k.catalog_name}.${k.name}" => k if lookup(k, "catalog_name", null) != null && lookup(k, "name", null) != null }
}

resource "databricks_grants" "schema_permissions" {
  for_each = { for k, v in local.schema_permissions : k => v if lookup(v, "grants", null) != null }

  schema = each.key

  dynamic "grant" {
    for_each = { for k in lookup(each.value, "grants", []) : k.principal => k.privileges if k != null && lookup(k, "principal", null) != null }
    content {
      principal  = grant.key
      privileges = grant.value
    }
  }
}
