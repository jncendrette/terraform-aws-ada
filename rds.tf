# Create RDS Database  MySQL
resource "aws_rds_cluster" "database-mysql" {
  cluster_identifier        = "database-mysql"
  availability_zones        = var.availability_zones
  db_subnet_group_name      = aws_db_subnet_group.database-mysql.name
  engine                    = "mysql"
  engine_version            = "5.7.44"
  db_cluster_instance_class = "db.md5.micro"
  storage_type              = "io2"
  allocated_storage         = var.allocated_storage
  iops                      = var.iops
  master_username           = "root"
  master_password           = var.master_password
  vpc_security_group_ids    = [aws_security_group.rds_sg.id]

  tags = {
    Name = "My_RDS_MySQL"
  }
}

# Create RDS Database MariaDB
resource "aws_db_instance" "database_mdb" {
  allocated_storage    = 20
  engine               = "mariadb"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "senha_segura"
  parameter_group_name = "default.mariadb10.6.13"
  skip_final_snapshot  = true

  tags = {
    Name = "Meu_RDS_MariaDB"
  }
}

