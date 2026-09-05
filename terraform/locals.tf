locals {
  environments = ["dev", "prod"]

  common_tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}
