resource "aws_instance" "name" {
    ami=var.ami_id
    instance_type = "t2.micro"
    tags = {
        Name="Tf_statefile"
    }
  
}