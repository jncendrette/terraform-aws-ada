# Create Public Subnets
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = cidrsubnet(var.cidr_vpc, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

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

resource "aws_db_subnet_group" "database-mysql" {
  name        = "database-mysql"
  description = "Grupo de Subnet para banco de dados RDS"
  subnet_ids  = aws_subnet.private_db[*].id

  tags = {
    Name       = "db-subnet-group"
    Tier       = "DB_Subnet_Group"
    Managed_by = "terraform"
  }
}