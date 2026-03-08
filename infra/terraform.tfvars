vpc_cidr_block       = "10.0.0.0/16"
vpc_instance_tenancy = "default"
vpc_name = "rithika-vpc"

pub_subnet_cidr_block = ""10.0.0.0/16""
pub_availability_zone = "eu-west-1a"
pub_subnet_name = var.pub_subnet_name

pvrt_subnet_cidr_block = "10.0.2.0/24"
pvrt_availability_zone = "eu-west-1b"
pvrt_subnet_name = "rithika-prvt-subnet"

pub_rt_cidr_block = "0.0.0.0/0" 
pub_rt_name = "rithika-pub-rt"

eip_name = "rithika-eip"

nat_gw_name = "rithika-gw-NAT"

pvrt_rt_cidr_block = "0.0.0.0/0" 
pvrt_rt_name = "rithika-prvt-rt"

key_name   = "rithika-key"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgshOigNlnR6HOE+z0MKf6LRtHRqi97PjodeyY2ZERTN5GJvWVoB2l6pvRIgCJkkdnfd6Cjqg/EVsfVbzwmr1hO5YiD+obgsF0Pniv2s6hF0LzlEBBq/uj57lZDcTbkqMyEZSSVQ62+wVJgeEaqt/f6/Q5dmljYOknqp9TX+"

sec_group_name        = "rithika-sgroup"
description = "Allow TLS inbound traffic and all outbound traffic"
sec_group_name = "rithika-sgroup"
ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
 }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
 }

pub_instance_ami           = "ami-019715e0d74f695be"
pub_instance_type = "t3.medium"
key_name = "rithika-key"
associate_public_ip_address = true
pub_instance_name = "rithika-pub-instance"

prvt_instance_ami           = "ami-019715e0d74f695be"
prvt_instance_type = "t3.medium"
key_name = "rithika-key"
associate_private_ip_address = false
prvt_instance_name = "rithika-prvt-instance"



