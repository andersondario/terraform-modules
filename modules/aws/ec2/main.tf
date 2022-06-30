data "aws_ami" "amazon_linux" {
    most_recent       = true

    filter {
        name          = "name"
        values        = [ "amzn-ami-hvm-*-x86_64-gp2" ]
    }

    filter {
        name          = "owner-alias"
        values        = [ "amazon" ]
    }
}


locals {
    availability_zone = "a"
    instance_type     = "t2.micro"
}

resource "aws_instance" "dev_instance" {
    instance_type     = local.instance_type
    ami               = data.aws_ami.amazon_linux.id

    associate_public_ip_address = true
    availability_zone = "${var.region}${local.availability_zone}"
    subnet_id         = var.default_subnet_id["${var.region}${local.availability_zone}"]

    tags = {
        "Name"        = var.instance_name
    }
}