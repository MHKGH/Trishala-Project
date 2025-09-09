output "trishala_vpc_id" {
  value = aws_vpc.trishala_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.trishala_public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.trishala_private_subnet.id
}
output "internet_gateway_id" {
  value = aws_internet_gateway.trishala_igw.id
}