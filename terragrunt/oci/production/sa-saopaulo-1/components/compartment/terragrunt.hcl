terraform {
  source = "../../../../modules/compartment"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  compartment_name       = "bootcamp1"
  compartment_description = "Compartment for bootcamp1 resources"
  compartment_id = local.compartment_id
}
