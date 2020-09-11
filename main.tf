terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    region = var.region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    cidr = var.cidr_range
    name= var.vpc_name

    public_subnets = var.aws_public_subnets
    private_subnets = var.aws_private_subnets
    azs = var.aws_azs

    tags = {
        Name = "linux_academy_sandbox"
    }
}

output "subnet_id" {
    value = module.vpc.public_subnets
}