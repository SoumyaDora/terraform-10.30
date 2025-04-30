provider "aws" {
  
}

resource "aws_instance" "name" {
  ami="ami-0f1dcc636b69a6438"
  instance_type = "t2.micro"
  for_each = toset(["Five","Six"])

  tags = {
    Name=each.value
  }
}