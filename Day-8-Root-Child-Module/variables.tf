variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "lennovoideapads"
}

variable "acl" {
  description = "Access control list"
  type        = string
  default     = "private"
}

variable "ami_id" {
  type        = string
  default = "ami-0f1dcc636b69a6438"
}

variable "instance_type" {
   type        = string
  default = "t2.micro"
}