resource "aws_vpc" "Tf" {
    cidr_block = "10.0.0.0/16"
  
}

resource "aws_subnet" "tf-1" {
  cidr_block = "10.0.1.0/28"
  vpc_id = aws_vpc.Tf.id
}