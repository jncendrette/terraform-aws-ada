variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Create 3 Availability Zones
variable "availability_zones" {
  description = "AZs para usar"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# Create variable for bucket name
variable "bucket_name" {
  description = "Bucket S3 da Aplicação"
  type        = string
  default     = "app-bucket-s3"
}

# Create variable for instance  type
variable "instance_type" {
  description = "Tipo de instância EC2"
  type        = string
  default     = "t2.micro"
}