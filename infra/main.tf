resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "rithika-vpc"
  }
}

# public subnet

resource "aws_subnet" "main-pub-sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = ""10.0.0.0/16""
  availability_zone = "ap-south-1a"

  tags = {
    Name = var.pub_subnet_name
  }
}

# private subnet

resource "aws_subnet" "main-prvt-sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "rithika-prvt-subnet"
  }
}

# internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "rithika-igw"
  }
}

# public route table

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"   # destination address
    gateway_id = aws_internet_gateway.gw.id   # target address
  }

  tags = {
    Name = "rithika-pub-rt"
  }
}

# associate public subnet with public route table

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main-pub-sub.id
  route_table_id = aws_route_table.pub-rt.id
}

# elastic ip address

resource "aws_eip" "lb" {

   tags = {
    Name = "rithika-eip"
    }
}

# nat gateway 

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.main-pub-sub.id

  tags = {
    Name = "rithika-gw-NAT"
  }

}

# private route table

resource "aws_route_table" "prvt-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"   # destination address
    gateway_id = aws_nat_gateway.example.id   # target address
  }

  tags = {
    Name = "rithika-prvt-rt"
  }
}

# associate private subnet with private route table

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.main-prvt-sub.id
  route_table_id = aws_route_table.prvt-rt.id
}

# create key pair

resource "aws_key_pair" "deployer" {
  key_name   = "rithika-key"
  public_key = " "
}

# create security group

resource "aws_security_group" "rithika-sgroup" {
  name        = "rithika-sgroup"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "rithika-sgroup"
  }

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
}

# create ec2 instance in public subnet 


resource "aws_instance" "public-instance" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t3.medium"
  key_name = "rithika-key"
  count = 1
  vpc_security_group_ids = [aws_security_group.murali-sg.id]
  subnet_id = aws_subnet.main-pub-sub.id
  associate_public_ip_address = true


  tags = {
    Name = "rithika-public-instance"
  }
}

# create ec2 instance in private subnet
resource "aws_instance" "private-instance" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t3.medium"
  key_name = "rithika-key"
  vpc_security_group_ids = [ aws_security_group.murali-sg.id ]
  subnet_id = aws_subnet.main-prvt-sub.id
  associate_public_ip_address = false


  tags = {
    Name = "rithika-private-instance"
  }
}

