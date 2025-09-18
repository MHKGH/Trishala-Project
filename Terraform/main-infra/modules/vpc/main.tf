resource "aws_vpc" "trishala_vpc" {
  cidr_block           = var.trishala_vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(
    var.tags,
    {
      Name = "${var.env}-trishala-vpc"
    }
  )
}

resource "aws_subnet" "trishala_public_subnet_1" {
  vpc_id                  = aws_vpc.trishala_vpc.id
  cidr_block              = var.public_subnet_cidr_block_1
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_1
  tags = merge(
    var.tags,
    { Name = "${var.env}-trishala-public-subnet-1" }
  )
}

resource "aws_subnet" "trishala_public_subnet_2" {
  vpc_id                  = aws_vpc.trishala_vpc.id
  cidr_block              = var.public_subnet_cidr_block_2
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_2
  tags = merge(
    var.tags,
    { Name = "${var.env}-trishala-public-subnet-2" }
  )
}

resource "aws_subnet" "trishala_private_subnet_1" {
  vpc_id     = aws_vpc.trishala_vpc.id
  cidr_block = var.private_subnet_cidr_block_1
  availability_zone = var.availability_zone_1
  tags = merge(
    var.tags,
    { Name = "${var.env}-trishala-private-subnet-1" }
  )
}

resource "aws_subnet" "trishala_private_subnet_2" {
  vpc_id     = aws_vpc.trishala_vpc.id
  cidr_block = var.private_subnet_cidr_block_2
  availability_zone = var.availability_zone_2
  tags = merge(
    var.tags,
    { Name = "${var.env}-trishala-private-subnet-2" }
  )
}

#Internet Gateway
resource "aws_internet_gateway" "trishala_igw" {
  vpc_id = aws_vpc.trishala_vpc.id
  tags = merge(
    var.tags,
    {
      Name = "${var.env}-trishala-Internet-Gateway"
    }
  )
}

# Trishala Public Route Table 
resource "aws_route_table" "trishala_public_rt" {
  vpc_id = aws_vpc.trishala_vpc.id
  tags = merge(
    var.tags,
    {
      Name = "${var.env}-trishala-public-rt"
    }
  )
}

resource "aws_route_table_association" "public_subnet_association" {
  for_each      = { for idx, subnet in [aws_subnet.trishala_public_subnet_1, aws_subnet.trishala_public_subnet_2] : idx => subnet }
  subnet_id     = each.value.id
  route_table_id = aws_route_table.trishala_public_rt.id
}

# Trishala Private Route Table
resource "aws_route_table" "trishala_private_rt" {
  vpc_id = aws_vpc.trishala_vpc.id
  tags = merge(
    var.tags,
    {
      Name = "${var.env}-trishala-private-rt"
    }
  )
}

resource "aws_route_table_association" "private_subnet_association" {
  for_each      = { for idx, subnet in [aws_subnet.trishala_private_subnet_1, aws_subnet.trishala_private_subnet_2] : idx => subnet }
  subnet_id     = each.value.id
  route_table_id = aws_route_table.trishala_private_rt.id
}

# Route for Private Subnet → Internet via NAT
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.trishala_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.trishala_igw.id
}

# Elastic IP for NAT
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.env}-nat-eip"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "trishala_nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.trishala_public_subnet_1.id
  tags = {
    Name = "${var.env}-nat-gw"
  }
}

# Route for Private Subnet → Internet via NAT
resource "aws_route" "private_internet_access" {
  route_table_id         = aws_route_table.trishala_private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.trishala_nat_gw.id
}