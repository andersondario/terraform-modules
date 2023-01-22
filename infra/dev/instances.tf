data "hcp_packer_image" "packer-prometheus-images" {
  bucket_name    = "packer-prometheus-images"
  channel        = "latest"
  cloud_provider = "gce"
  region         = "us-central1-a"
}

module "prometheus_ip" {
  source = "../../modules/gcp/external-ip"

  project     = var.project_id
  environment = var.environment

  ip_name = "prometheus-ip"
}

module "prometheus" {
  source = "../../modules/gcp/gce"

  project     = var.project_id
  environment = var.environment

  instance_name  = "prometheus"
  instance_type  = "e2-medium"
  zone           = "us-central1-a"
  tags           = ["prometheus"]
  boot_disk_size = "20"
  image          = data.hcp_packer_image.packer-prometheus-images.cloud_image_id
  network_name   = var.default_vpc_name
  subnet_name    = var.default_subnet_name
  static_ip      = module.prometheus_ip.static_ip

  depends_on = [
    module.prometheus_ip
  ]
}