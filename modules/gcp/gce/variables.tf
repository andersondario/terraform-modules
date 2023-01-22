variable "project" {
  type        = string
  description = "Project ID"
}

variable "environment" {
  type        = string
  description = "Environment Name"
}

variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "zone" {
  type = string
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "boot_disk_size" {
  type    = string
  default = "10"
}

variable "boot_disk_type" {
  type    = string
  default = "pd-standard"
}

variable "image" {
  type = string
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "isprod_tag" {
  type    = string
  default = "false"
}

variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "static_ip" {
  type = string
}