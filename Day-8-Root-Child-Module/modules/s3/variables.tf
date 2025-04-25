variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  
}

variable "acl" {
  description = "The canned ACL to apply"
  type        = string
  default     = "private"
}
