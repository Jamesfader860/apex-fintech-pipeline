# 1. Create the Main Virtual Private Cloud (VPC)
resource "aws_vpc" "apex_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "apex-fintech-vpc"
    Environment = "production"
  }
}

# 2. Create the Internet Gateway (Public Internet Door)
resource "aws_internet_gateway" "apex_igw" {
  vpc_id = aws_vpc.apex_vpc.id

  tags = {
    Name = "apex-igw"
  }
}

# 3. Create Public Subnet (For Load Balancers)
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.apex_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "apex-public-subnet-1"
  }
}

# 4. Create Private Subnet (For EKS App Nodes & Database)
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.apex_vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "apex-private-subnet-1"
  }
}