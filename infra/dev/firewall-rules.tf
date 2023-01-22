locals {
  firewall_rules = [
    {
      name              = "prometheus"
      description       = "Allow public access to Prometheus"
      allowed_tcp_ports = ["9090"]
      source_tags       = []
    }
  ]
}

module "firewall" {
  source = "../../modules/gcp/firewall-rule"
  for_each = {
    for index, rule in local.firewall_rules : rule.name => rule
  }

  project     = var.project_id
  environment = var.environment

  name              = each.value.name
  description       = each.value.description
  allowed_tcp_ports = each.value.allowed_tcp_ports
  source_tags       = each.value.source_tags
  network_name      = var.default_vpc_name
}