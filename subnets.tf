# Create Public Subnets
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.ada_aws_vpc.id
  cidr_block              = var.cidr_vpc
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[count.index]

  tags = {
    Name       = "public-subnet-${count.index + 1}"
    Tier       = "Public"
    Managed_by = "terraform"

  }
}

# Create Private Subnets
resource "aws_subnet" "private_app" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = cidrsubnet(var.cidr_vpc, 4, count.index + 3)
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name       = "private-app-subnet-${count.index + 1}"
    Tier       = "Private-App"
    Managed_by = "terraform"

  }
}
# Create Private Database Subnets
resource "aws_subnet" "private_db" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = cidrsubnet(var.cidr_vpc, 4, count.index + 6)
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name       = "private-db-subnet-${count.index + 1}"
    Tier       = "Private-DB"
    Managed_by = "terraform"
  }
}
