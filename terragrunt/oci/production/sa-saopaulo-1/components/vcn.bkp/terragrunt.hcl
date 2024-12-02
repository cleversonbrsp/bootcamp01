dependency "compartment" {
  config_path = "../compartment"
}

terraform {
  source = "../../../../modules/vcn"
}

inputs = {
  compartment_id = dependency.compartment.outputs.compartment_id  # Usa o ID do compartment criado
  vcn_name       = "my-vcn"
  dns_label      = "myvcn"
#  cidr_blocks    = ["10.0.0.0/16", "11.0.0.0/16"]
}


# dependency "compartment" {
#   config_path = "../compartment"
# }

# locals {
#   account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
#   region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))

#   account_name     = local.account_vars.locals.account_name
#   tenancy_ocid     = local.account_vars.locals.tenancy_ocid
#   user_ocid        = local.account_vars.locals.user_ocid
#   fingerprint      = local.account_vars.locals.fingerprint
#   private_key_path = local.account_vars.locals.private_key_path
#   oci_region       = local.region_vars.locals.oci_region
#   compartment_id   = dependency.compartment.outputs.compartment_id
# }

# inputs = merge(
#   {
#     account_name     = local.account_name
#     tenancy_ocid     = local.tenancy_ocid
#     user_ocid        = local.user_ocid
#     fingerprint      = local.fingerprint
#     private_key_path = local.private_key_path
#   },
#   {
#     oci_region = local.oci_region
#   },
#   {
#     compartment_id = dependency.compartment.outputs.compartment_id
#     project_name   = "bootcamp01"
#   }
# )

# terraform {
#   source = "../../../../modules/vcn"
# }



# include {
#   path = find_in_parent_folders()
# }

# Indicate where to source the terraform module from.
# The URL used here is a shorthand for
# "tfr://registry.terraform.io/oracle-terraform-modules/vcn/oci?version=3.6.0".
# Note the extra `/` after the protocol is required for the shorthand
# notation.

# terraform {
#   source = "tfr:///oracle-terraform-modules/vcn/oci?version=3.6.0"
# }

# inputs = {
#   compartment_id = "ocid1.compartment.oc1..aaaaaaaax67alki7g3cwjwaghbcwsyuenzbmttvpn4zt4vmzv6wrg5fpbu7q"
#   vcn_name       = "my_vcn"
#   vcn_cidrs      = ["10.0.0.0/16"]
#   enable_ipv6    = false
#   create_internet_gateway = true
#   create_nat_gateway      = true
#   create_service_gateway  = true

#   internet_gateway_display_name = "internet-gateway"
#   nat_gateway_display_name      = "nat-gateway"
#   subnets = {
#     "subnet1" = {
#       cidr_block = "10.0.1.0/24"
#       type       = "public"
#     }
#     "subnet2" = {
#       cidr_block = "10.0.2.0/24"
#       type       = "private"
#     }
#   }
#   label_prefix = "prod"
#   internet_gateway_route_rules = [
#     {
#       cidr_block = "0.0.0.0/0"
#       destination = "internet"
#     }
#   ]
#   nat_gateway_route_rules = [
#     {
#       cidr_block = "0.0.0.0/0"
#       destination = "nat"
#     }
#   ]
#   service_gateway_display_name = "service-gateway"
# }
