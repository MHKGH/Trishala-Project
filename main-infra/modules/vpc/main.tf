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

resource "aws_subnet" "trishala_public_subnet" {
  vpc_id                  = aws_vpc.trishala_vpc.id
  cidr_block              = var.public_subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone
  tags = merge(
    var.tags,
    {
      Name = "${var.env}-trishala-public-subnet"
    }
  )
}

resource "aws_subnet" "trishala_private_subnet" {
  vpc_id     = aws_vpc.trishala_vpc.id
  cidr_block = var.private_subnet_cidr_block
  tags = merge(
    var.tags,
    {
      Name = "${var.env}-trishala-private-subnet"
    }
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
resource "aws_route_table_association" "trishala_public_subnet_association" {
  subnet_id      = aws_subnet.trishala_public_subnet.id
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

resource "aws_route_table_association" "trishala_private_subnet_association" {
  subnet_id      = aws_subnet.trishala_private_subnet.id
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
  subnet_id     = aws_subnet.trishala_public_subnet.id
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