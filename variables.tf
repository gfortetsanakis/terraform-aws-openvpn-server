variable "aws_region" {
  description = "The aws region at which the module will be deployed."
}

variable "vpc_id" {
  description = "The id of the VPC at which the OpenVPN server will be installed."
}

variable "openvpn_client_cidrs" {
  description = "List of CIDR blocks that are allowed to connect to the OpenVPN server."
}

variable "openvpn_key_path" {
  description = "The path to the public ssh key file for the OpenVPN server."
}

variable "openvpn_instance_type" {
  description = "The instance type for the OpenVPN server."
}

variable "openvpn_subnet_id" {
  description = "The id of the VPC subnet at which the OpenVPN server will de deployed."
}

variable "openvpn_user" {
  description = "The name of the first OpenVPN user to be created automatically during the installation."
}

variable "openvpn_protocol" {
  description = "The network protocol to be used for establishing the conection. Default is \"udp\"."
  default = "udp"
}