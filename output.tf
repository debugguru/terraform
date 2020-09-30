output "subnet_id" {
    value = module.vpc.public_subnets
}

output "public_ip" {
    value = module.ec2_cluster.public_ip
}