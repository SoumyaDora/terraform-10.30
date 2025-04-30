provider "aws" {
  region = "ap-south-1"  
}


data "aws_vpc" "default" {
  default = true
}


data "aws_subnet" "default" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "ap-south-1a"
}


data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id

  filter {
    name   = "group-name"
    values = ["default"]
  }
}


data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Launch the EC2 instance
resource "aws_instance" "default_server" {
  ami           = data.aws_ami.amzlinux.id
  instance_type = "t2.micro"

  subnet_id                   = data.aws_subnet.default.id
  vpc_security_group_ids      = [data.aws_security_group.default.id]
  associate_public_ip_address = true

  tags = {
    Name = "DefaultServer"
  }
}
