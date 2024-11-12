resource "aws_security_group" "ec2_sg" {
  name        = "enable_ssh_http"
  description = "Habilitar Protocolos SSH e HTTP"
  vpc_id      = aws_vpc.main_vpc.id


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main_vpc.cidr_block]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "EC2-SG"
  }
}

# Security group for RDS
resource "aws_security_group" "rds_sg" {
  name   = "rds_sg"
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "rds_sg"
  }
}

resource "aws_security_group_rule" "rds_sg-rule" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id
  cidr_blocks       = [aws_vpc.main_vpc.cidr_block]
}

resource "aws_security_group" "lb-sec" {
  name        = "lb-sec"
  description = "Permitir todo trafico de entrada e saída"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "lb-sec"
  }
}



resource "aws_security_group_rule" "lb-sec-rule-ingress-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.lb-sec.id
  cidr_blocks       = [aws_vpc.main_vpc.cidr_block]
}

resource "aws_security_group_rule" "lb-sec-rule-ingress-https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.lb-sec.id
  cidr_blocks       = [aws_vpc.main_vpc.cidr_block]
}

resource "aws_security_group_rule" "lb-sec-rule-egress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.lb-sec.id
  cidr_blocks       = ["0.0.0.0/0"]
}