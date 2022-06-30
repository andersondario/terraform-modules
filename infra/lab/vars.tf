variable "access_key" {}
variable "secret_key" {}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "vpc_name" {
    type = string
}

variable "ec2_name" {
    type = string
}