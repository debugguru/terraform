# Builds a VPC, Private and Public Subnet with webservers for Linux Academy labs on AWS

This module provisions a new VPC with a private and public subnet. 

# How to use this?
1. Clone the repo locally
2. Edit terraform.tfvars and update aws_access_key and aws_secret_key with your account keeys
3. Validate terraform files are correct by running "terraform validate" 
4. Check what changes are going to be applued by running "terraform plan"
5. Create the infrastructure using "terraform apply"