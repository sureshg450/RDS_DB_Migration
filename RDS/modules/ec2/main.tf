resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "ec2_sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "aec2_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}

resource "aws_instance" "db_server" {
  ami           = var.ami_id
  instance_type = var.instance_Type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  
  tags = {
    Name = "dbserver"
  }
}