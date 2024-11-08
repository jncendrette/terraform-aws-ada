# Create terra_aws_vpc VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name       = "Main-VPC"
    Managed_by = "terraform"
  }
}
