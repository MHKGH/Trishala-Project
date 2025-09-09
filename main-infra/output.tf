output "trishala_vpc_id" {
  value = module.vpc.trishala_vpc_id

}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}   

output "trishala_sg_name" {
  value = module.sg.trishala_sg_name

}

output "trishala_sg_id" {
  value = module.sg.trishala_sg_id
}

output "jenkins_server_instance_id" {
  value = module.ec2.jenkins_server_instance_id
}


output "jenkins_server_public_ip" {
  value = module.ec2.jenkins_server_public_ip
}