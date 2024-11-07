# Create terra_aws_vpc VPC
resource "aws_vpc" "terra_aws_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Terra_AWS_VPC"
  }
}
