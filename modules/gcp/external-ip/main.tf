resource "google_compute_address" "static" {
  name         = var.ip_name
  address_type = "EXTERNAL"
  region       = var.region
}