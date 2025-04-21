resource "aws_instance" "test" {
  ami="ami-002f6e91abff6eb96"
  instance_type = "t2.micro"
  
}

resource "aws_vpc" "Tf" {
    cidr_block = "10.0.0.0/16"
    depends_on = [ aws_instance.test]
}

