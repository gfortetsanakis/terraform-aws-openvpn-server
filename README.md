# Terraform module for OpenVPN server

This module deploys an OpenVPN server on a public subnet of an AWS VPC. By connecting to this server, users will be able to access VPC private resources, i.e., they will be able to connect to services deployed within the VPC using their private IP addresses.

## Module input parameters

| Parameter             | Type     | Description                                                                            |
| --------------------- | -------- | -------------------------------------------------------------------------------------- |
| aws_region            | Required | The aws region at which the module will be deployed                                    |
| vpc_id                | Required | The id of the VPC at which the OpenVPN server will be installed                        |
| openvpn_client_cidrs  | Required | List of CIDR blocks that are allowed to connect to the OpenVPN server                  |
| openvpn_key          | Required | The public ssh key for the OpenVPN server                                              |
| openvpn_instance_type | Required | The instance type for the OpenVPN server                                               |
| openvpn_subnet_id     | Required | The id of the VPC subnet at which the OpenVPN server will de deployed                  |
| openvpn_user          | Required | The name of the first OpenVPN user to be created automatically during the installation |
| openvpn_protocol      | Optional | The network protocol to be used for establishing the conection. Default is "udp"       |

## Module output parameters

| Parameter              | Description                                                     |
| ---------------------- | --------------------------------------------------------------- |
| openvpn_server_dns     | The public DNS of the openVPN server                            |
| openvpn_sg_id          | The id of the security group associated with the OpenVPN server |