locals {
  openvpn_images = {
    us-east-1    = "ami-037ff6453f0855c46"
    us-east-2    = "ami-04406fdec0f245050"
    us-west-1    = "ami-0ce1d8c91d5b9ee92"
    us-west-2    = "ami-0d10bccf2f1a6d60b"
    eu-north-1   = "ami-067349b5a5143523d"
    eu-central-1 = "ami-0764964fdfe99bc31"
    eu-west-1    = "ami-0e1415fedc1664f51"
    eu-west-2    = "ami-056465a2a49aad6d9"
    eu-west-3    = "ami-0b8d6b68595965460"
  }

  openvpn_security_group = {
    name        = "openvpn-sg"
    description = "Security Group for openvpn server"
    ingress = {
      ssh = {
        from        = 22
        to          = 22
        protocol    = "tcp"
        cidr_blocks = var.openvpn_client_cidrs
      }
      ui = {
        from        = 943
        to          = 943
        protocol    = "tcp"
        cidr_blocks = var.openvpn_client_cidrs
      }
      https = {
        from        = 443
        to          = 443
        protocol    = "tcp"
        cidr_blocks = var.openvpn_client_cidrs
      }
      daemon = {
        from        = 1194
        to          = 1194
        protocol    = var.openvpn_protocol
        cidr_blocks = var.openvpn_client_cidrs
      }
    }
  }

  protocol = {
    udp = 1
    tcp = 2
  }
}