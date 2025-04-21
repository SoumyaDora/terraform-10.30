
terraform {
  backend "s3" {
    bucket ="vpcec2sunet"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
