# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform/OpenTofu that provides extra tools for working with multiple modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

locals {
  # Automatically load account-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  # Extract the variables we need for easy access
  account_name     = local.account_vars.locals.account_name
  tenancy_ocid     = local.account_vars.locals.tenancy_ocid
  user_ocid        = local.account_vars.locals.user_ocid
  fingerprint      = local.account_vars.locals.fingerprint
  private_key_path = local.account_vars.locals.private_key_path
  oci_region       = local.region_vars.locals.oci_region
  compartment_id = local.account_vars.locals.compartment_id
}

inputs = merge(
  # Variáveis de conta
  {
    account_name     = local.account_name
    tenancy_ocid     = local.tenancy_ocid
    user_ocid        = local.user_ocid
    fingerprint      = local.fingerprint
    private_key_path = local.private_key_path
    oci_region       = local.oci_region
  },

  # Variáveis de região
  {
    oci_region = local.oci_region
  },

  # Outras variáveis específicas do módulo
  {
    compartment_id = local.compartment_id
    project_name   = "bootcamp01"
  }
)

# Generate an OCI provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "oci" {
  region       = "${local.oci_region}"
  tenancy_ocid = "${local.tenancy_ocid}"
  user_ocid    = "${local.user_ocid}"
  fingerprint  = "${local.fingerprint}"
  private_key_path = "${local.private_key_path}"
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
# terraform {
#   backend "s3" {
#     bucket = "terragrunt-state"
#     region = "sa-saopaulo-1"
#     key = "${path_relative_to_include()}/tf.tfstate"
#     skip_region_validation = true
#     skip_credentials_validation = true
#     skip_requesting_account_id = true
#     skip_s3_checksum = true
#     use_path_style = true
#     #insecure = true
#     skip_metadata_api_check = true
#     endpoints = { s3 = "https://gr5qapclqypq.compat.objectstorage.sa-saopaulo-1.oraclecloud.com" } 
#   }
# }

# remote_state {
#   backend "s3"
#   config = {
#     bucket         = "terragrunt-state"
#     region = "sa-saopaulo-1"
#     key = "${path_relative_to_include()}/tf.tfstate"
#     skip_region_validation = true
#     skip_credentials_validation = true
#     skip_requesting_account_id = true
#     skip_s3_checksum = true
#     use_path_style = true
#     skip_metadata_api_check = true
#     endpoints = { s3 = "https://gr5qapclqypq.compat.objectstorage.sa-saopaulo-1.oraclecloud.com" }
#   }
# }


