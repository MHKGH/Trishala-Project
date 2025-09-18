output "trishala_vpc_id" {
  value = aws_vpc.trishala_vpc.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.trishala_public_subnet_1.id,
    aws_subnet.trishala_public_subnet_2.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.trishala_private_subnet_1.id,
    aws_subnet.trishala_private_subnet_2.id
  ]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.trishala_igw.id
}