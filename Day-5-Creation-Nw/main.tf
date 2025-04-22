#Vpc
#Ig And attach to Vpc
#Subnet                                                 ---PUBLIC SERVER---
#Route Table & Routes & Subnet association
#Create SG
#Launch Server


#---------------------------------------------------------------------------------------------------

#Vpc
resource "aws_vpc" "pub-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name="pub-vpc"
    }
}

#Ig And attach to Vpc
resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.pub-vpc.id
    tags = {
      Name="cust-ig"
    }
}

#Subnet creation
resource "aws_subnet" "pub-sub" {
    cidr_block = "10.0.1.0/28"
    vpc_id = aws_vpc.pub-vpc.id
    availability_zone = "ap-south-1a"  
}

#Route Table
resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.pub-vpc.id

    route  {
        cidr_block="0.0.0.0/0"
        gateway_id=aws_internet_gateway.ig.id
    }
    tags = {
      Name="pub-Rt"
    }  
}

#Subnet Association in RT
resource "aws_route_table_association" "pub_asso" {
    subnet_id = aws_subnet.pub-sub.id
    route_table_id = aws_route_table.pub_rt.id
}

# Create SG
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  vpc_id      = aws_vpc.pub-vpc.id
  tags = {
    Name = "cust_sg"
  }
 ingress {
    description      = "Http"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #all protocols 
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

}
#Key_Pair
#resource "aws_key_pair" "multicloud" {
  ##  public_key = file("~/.ssh/id_ed25519")
#}

#Launch Server
resource "aws_instance" "name" {
    ami = "ami-0f1dcc636b69a6438"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.pub-sub.id
    associate_public_ip_address = true
    key_name               = "multicloud"
    vpc_security_group_ids = [aws_security_group.allow_all.id]

    
}