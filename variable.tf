variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Create 3 Availability Zones
variable "availability_zones" {
  description = "Multi-AZs"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


# Create variable for bucket name
variable "bucket_name" {
  description = "Bucket S3 da Aplicação"
  type        = string
  default     = "bucket-s3-jcendrette"
}

# Create variable for instance  type
variable "instance_type" {
  description = "Tipo de instância EC2"
  type        = string
  default     = "t3.micro"
}

variable "allocated_storage" {
  description = "Armazenamento RDS"
  type        = number
  default     = 100
}

variable "iops" {
  description = "Inputs e Outputs do RDS"
  type        = number
  default     = 3000
}

variable "master_password" {
  description = "Senha do RDS Mysql"
  type        = string
  default     = "Training1!"
}