
terraform {
  backend "s3" {
    bucket ="testgdhuej"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
