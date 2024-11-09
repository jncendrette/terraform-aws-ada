resource "aws_security_group" "ec2_sg" {
  name        = "enable_ssh_http"
  description = "Habilitar Protocolos SSH e HTTP"
  vpc_id      = aws_vpc.main_vpc.id

}