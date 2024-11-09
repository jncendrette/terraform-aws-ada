# Create 3 Amazon EC2
resource "aws_instance" "vm_ec2" {
  count                  = length(var.availability_zones)
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_app[count.index].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "vm-az-${element(var.availability_zones, count.index)}"
  }
}
