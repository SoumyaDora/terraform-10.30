
resource "aws_instance" "po" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}