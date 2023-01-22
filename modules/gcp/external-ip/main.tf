resource "google_compute_address" "static" {
  name         = var.ip_name
  address_type = var.type
  ip_version   = "IPV4"
  project      = var.project
}

resource "google_compute_address" "internal_with_subnet_and_address" {
  name         = var.ip_name
  subnetwork   = var.subnet_name
  address_type = "EXTERNAL"
  region       = var.region
}