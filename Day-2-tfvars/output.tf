output "IP" {
    value =aws_instance.s1.public_ip
  
}
output "Private_Ip" {
    value =aws_instance.s1.private_ip
    sensitive = true
  
}