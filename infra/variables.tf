# vpc varibles

variable "vpc_cidr_blcok" {
  description = "this is for vpc cidr block"
}

variable "instance_tenancy" {
  description = "this is vpc tenancy name"
}

variable "vpc_name" {
  description = "this is a vpc name"
}

# public subnet variables

variable "pub_subnet_cidr_block" {
  description = "this is for public subnet cidr block"
}

variable "pub_availability_zone" {
  description = "this is for public subnet availability zone"  
}

variable "pub_subnet_name" {
  description = "this is for public subnet name"  
}
# public subnet variables

variable "prvt_subnet_cidr_block" {
  description = "this is for public subnet cidr block"
}

variable "prvt_availability_zone" {
  description = "this is for public subnet availability zone"  
}

variable "prvt_subnet_name" {
  description = "this is for public subnet name"  
}

variable "pub_rt_cidr_block"{
description = "public route cidr block"
}

variable "pub_rt_name"{
description = "public route name"}


variable "eip_name"{
description = "eip name"
}

variable "nat_gw_name"{
description = "nat_gw_name"
}


variable "pvrt_rt_cidr_block"{
description = "pvrt_rt_cidr_block"
}

variable "pvrt_rt_name"{
description = "rout name"
}

variable "key_name"{
description = "key name"
}

variable "public_key"{
description = "pub key name"
}

variable "sec_group_name "{
description = "eip name"
}


variable "sec_group_name "{
description = "eip name"
}


variable "pub_instance_ami "{
description = "eip name"
}

variable " pub_instance_type"{
description = "eip name"
}

variable "associate_public_ip_address "{
description = "eip name"
}

variable "pub_instance_name"{
description = "name"
}


variable "prvt_instance_ami "{
description = "eip name"
}

variable " prvt_instance_type"{
description = "eip name"
}

variable "associate_public_ip_address "{
description = "eip name"
}

variable "prvt_instance_name"{
description = "name"
}








