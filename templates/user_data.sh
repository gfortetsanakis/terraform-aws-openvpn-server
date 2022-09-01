#! /bin/bash 
yum update 
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh 
chmod +x openvpn-install.sh 
APPROVE_INSTALL=y ENDPOINT=$(curl -4 ifconfig.co) APPROVE_IP=y \
IPV6_SUPPORT=n PORT_CHOICE=1 PROTOCOL_CHOICE=${protocol[var.openvpn_protocol]} DNS=1 COMPRESSION_ENABLED=n \
CUSTOMIZE_ENC=n CLIENT=${openvpn_user} PASS=1 ./openvpn-install.sh
rm -f /root/openvpn-install.sh
cp /root/${openvpn_user}.ovpn /home/ec2-user/
rm -f /root/${openvpn_user}.ovpn
chown ec2-user:ec2-user /home/ec2-user/${openvpn_user}.ovpn