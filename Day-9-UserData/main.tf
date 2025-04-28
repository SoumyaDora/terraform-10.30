resource "aws_instance" "name" {
    ami = "ami-085ad6ae776d8f09c"
    instance_type = "t2.micro"
    # key_name = "ec2test"
    availability_zone = "us-east-1a"
    user_data = file("test.sh")
}