resource "google_compute_global_address" "static" {
  name         = var.ip_name
  address_type = var.type
  ip_version   = "IPV4"
  project      = var.project
}
