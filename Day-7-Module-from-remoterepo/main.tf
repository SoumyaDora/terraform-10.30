module "NS" {
    source = "github.com/SoumyaDora/terraform-10.30/Day-7-Module-Source"
    ami_id = "ami-002f6e91abff6eb96"
    instance_type = "t2.micro"
    aws_region = "ap-south-1"

  
}