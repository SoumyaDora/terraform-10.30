
resource "aws_instance" "s1" {
    ami=var.ami
    instance_type = var.type_id

}
