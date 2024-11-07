# Create terra_aws_vpc VPC
resource "aws_vpc" "tf_aws_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Terraform_AWS_VPC"
  }
}
