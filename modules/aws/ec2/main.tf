data "aws_ami" "amazon_linux" {
    owners = ["amazon"]
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
    instance_type     = "t2.micro"
}

resource "aws_instance" "dev_instance" {
    instance_type     = local.instance_type
    ami               = data.aws_ami.amazon_linux.id

    associate_public_ip_address = true
    subnet_id         = var.subnet_id

    tags = {
        "Name"        = var.ec2_name
    }
}