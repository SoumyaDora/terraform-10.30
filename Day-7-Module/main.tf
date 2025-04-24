module "NS" {
    source = "../Day-7-Module-Source"
    ami_id = "ami-002f6e91abff6eb96"
    instance_type = "t2.micro"
    aws_region = "ap-south-1"

  
}