data "aws_ami" "openvpn_instance_ami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}

resource "aws_key_pair" "openvpn_key" {
  key_name   = "openvpn-server-key"
  public_key = file(var.openvpn_key_path)
}

resource "aws_security_group" "openvpn_sg" {
  name        = local.openvpn_security_group["name"]
  description = "The security group of the openVPN server."
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = local.openvpn_security_group["ingress"]
    content {
      from_port   = ingress.value.from
      to_port     = ingress.value.to
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "openvpn_server" {
  ami                         = data.aws_ami.openvpn_instance_ami.id
  instance_type               = var.openvpn_instance_type
  vpc_security_group_ids      = [aws_security_group.openvpn_sg.id]
  associate_public_ip_address = true
  subnet_id                   = var.openvpn_subnet_id
  key_name                    = aws_key_pair.openvpn_key.key_name
  user_data = templatefile("${path.module}/templates/user_data.sh", {
    openvpn_user = var.openvpn_user
    }
  )

  tags = {
    Name = "openVPN-server"
  }
}

resource "aws_eip" "openvpn_server_eip" {
  instance = aws_instance.openvpn_server.id
  vpc      = true
}