resource "aws_instance" "example_instance" {
  instance_type        = "t2.micro"
  ami                  = "ami-55414"
  iam_instance_profile = data.aws_iam_instance_profile.existing_role.role_name
}