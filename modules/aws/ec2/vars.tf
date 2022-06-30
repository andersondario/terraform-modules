variable "region" {
    type = string
}

variable "amazon_linux2_ami" {
    type = map(string)
    default = {
        "us-east-1" = "ami-0cff7528ff583bf9a"
    }
}

variable "default_subnet_id" {
    type = map(string)
}