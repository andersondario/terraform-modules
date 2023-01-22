variable "project" {
  type        = string
  description = "Project ID"
}

variable "environment" {
  type        = string
  description = "Environment Name"
}

variable "ip_name" {
  type = string
}

variable "type" {
  type    = string
  default = "EXTERNAL"
}