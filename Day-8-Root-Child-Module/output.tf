output "bucket_id" {
  value = module.s3_bucket.bucket_id
}


output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}
