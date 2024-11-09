output "vpc_id" {
  description = "O ID do VPC"
  value       = aws_vpc.main_vpc.id
}

output "public_subnet_ids" {
  description = "Lista de IDs publicas subnets"
  value       = aws_subnet.public[*].id
}

output "private_app_subnet_ids" {
  description = "Lista de IDs de aplicações privadas subnets"
  value       = aws_subnet.private_app[*].id
}

output "private_db_subnet_ids" {
  description = "Lista privada de IDs subnet do BD"
  value       = aws_subnet.private_db[*].id
}

output "nat_gateway_ids" {
  description = "Lista IDs de NAT Gateway"
  value       = aws_nat_gateway.main_nat[*].id
}

output "bucket" {
  description = "Bucket do S3"
  value       = aws_s3_bucket.main_bucket.bucket
}

output "ec2_ids" {
  description = "Lista de VMs EC2"
  value       = aws_instance.vm_ec2[*].id
}