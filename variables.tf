variable "data_catalog_taxonomy_iam_bindings" {
  description = <<EOT
Map of data_catalog_taxonomy_iam_bindings, attributes below
Required:
    - members
    - role
    - taxonomy
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members  = set(string)
    role     = string
    taxonomy = string
    project  = optional(string)
    region   = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

