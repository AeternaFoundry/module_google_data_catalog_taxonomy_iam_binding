resource "google_data_catalog_taxonomy_iam_binding" "data_catalog_taxonomy_iam_bindings" {
  for_each = var.data_catalog_taxonomy_iam_bindings

  members  = each.value.members
  role     = each.value.role
  taxonomy = each.value.taxonomy
  project  = each.value.project
  region   = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

