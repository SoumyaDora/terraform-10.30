variable "aws" {
    type = list(string)
    default = [ "Dev","Test" ] 
}

resource "aws_instance" "name" {
    ami ="ami-0f1dcc636b69a6438"
    instance_type = "t2.micro"
    count = length(var.aws)

    tags = {
      Name = var.aws[count.index]
    }
  
}