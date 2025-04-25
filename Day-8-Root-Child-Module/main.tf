provider "aws" {
  region = "ap-south-1"
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  acl         = var.acl
}

module "ec2_instance" {
  source = "./modules/ec2"
  instance_name = "my-ec2-instance"
  ami_id        = "ami-0f1dcc636b69a6438" 
  instance_type = "t2.micro"
}
