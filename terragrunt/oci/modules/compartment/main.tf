provider "oci" {
  region = var.region
}
resource "oci_identity_compartment" "compartment" {
  name                     = var.compartment_name
  description              = var.compartment_description
  compartment_id           = var.compartment_id
}