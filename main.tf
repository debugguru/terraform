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
        Terraform   = "true"
    }
}

module "ec2_cluster" {
    source                 = "terraform-aws-modules/ec2-instance/aws"
    version                = "~> 2.0"

    name                   = "sandbox"
    instance_count         = 2

    ami                    = var.aws_ec2_ami
    instance_type          = "t2.micro"
    monitoring             = true
    //vpc_security_group_ids = movpc.public_subnets[0]
    subnet_id              = module.vpc.public_subnets[0]

    tags = {
        Terraform   = "true"
        Name = "linux_academy_sandbox"
    } 
}

module "http_80_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 3.0"

  # omitted...
  name = "linuxacademy"
  vpc_id = module.vpc.vpc_id
}