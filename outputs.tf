output "openvpn_server_dns" {
  value = aws_instance.openvpn_server.public_dns
}

output "openvpn_sg_id" {
  value = aws_security_group.openvpn_sg.id
}