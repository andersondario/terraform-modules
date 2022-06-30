terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.19.0"
        }
    }
}

provider "aws" {
    region     = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

module "vpc" {
    source     = "../../modules/aws/vpc"  
    region     = var.region
    vpc_name   = var.vpc_name
}


module "instance" {
    source     = "../../modules/aws/ec2"
    region     = var.region
    ec2_name   = var.ec2_name
    subnet_id  = module.vpc.subnets[0]
}