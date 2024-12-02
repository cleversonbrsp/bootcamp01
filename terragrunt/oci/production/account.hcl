# Definir variáveis de conta para a OCI
locals {
  account_name      = "production"
  tenancy_ocid      = "ocid1.tenancy.oc1..aaaaaaaa43f5wgflfnq573gydslom3jx5wjiqt5bx5c6okojjt7mdjutyzma"
  user_ocid         = "ocid1.user.oc1..aaaaaaaaqva4dxidjnljysw3qdue7cdrkoyw7uokaf5mjqy3ko2a52ghv4ma"
  fingerprint       = "67:2c:c3:a8:b6:c5:a3:a4:c2:1b:fa:e8:a8:6a:a8:a0"
  private_key_path  = "~/.ssh/cloud.clever.son@gmail.com_private.pem"
  region            = "sa-saopaulo-1"
#  compartment_id    = "ocid1.tenancy.oc1..aaaaaaaa43f5wgflfnq573gydslom3jx5wjiqt5bx5c6okojjt7mdjutyzma"
}
