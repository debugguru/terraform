variable "region" {
    type = string
}

variable "cidr_range" {
    type = string
}

variable "vpc_name" {
    type = string
}

variable "aws_access_key" {
    type = string
}

variable "aws_secret_key" {
    type = string
}

variable "aws_public_subnets" {
    type = list(string)
}

variable "aws_private_subnets" {
    type = list(string)
}

variable "aws_azs" {
    type = list(string)
}