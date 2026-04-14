resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
 
  tags = {
    Name = "terraform-lab-vpc"
  }
}
 
# Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
 
  tags = {
    Name = "public-subnet"
  }
}
 
# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
 
  tags = {
    Name = "terraform-igw"
  }
}
 
# Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.this.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
 
  tags = {
    Name = "public-rt"
  }
}
 
# Associate subnet with route table
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}
 
