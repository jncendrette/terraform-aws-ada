resource "aws_rds_cluster" "database-mysql" {
  cluster_identifier        = "database-mysql"
  availability_zones        = var.availability_zones
  db_subnet_group_name      = aws_db_subnet_group.database-mysql.name
  engine                    = "mysql"
  engine_version            = "8.0.39"
  db_cluster_instance_class = "db.m5d.large"
  storage_type              = "io2"
  allocated_storage         = var.allocated_storage
  iops                      = var.iops
  master_username           = "admin"
  master_password           = var.master_password
}