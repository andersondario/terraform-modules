resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    auto_delete = true
    mode        = "READ_WRITE"

    initialize_params {
      size  = var.boot_disk_size
      type  = var.boot_disk_type
      image = var.image
    }
  }

  deletion_protection = var.deletion_protection

  labels = {
    terraform = "true"
    isprod    = "${var.isprod_tag}"
  }

  network_interface {
    access_config {
      nat_ip       = var.static_ip
      network_tier = "PREMIUM"
    }

    network    = var.network_name
    subnetwork = var.subnet_name
  }

  project = var.project

  reservation_affinity {
    type = "ANY_RESERVATION"
  }
}