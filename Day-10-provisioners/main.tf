provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "server" {
  ami           = "ami-0f1dcc636b69a6438"
  instance_type = "t2.micro"
  key_name      = "multicloud"  # Use existing key pair name

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/multicloud.pem")  # Make sure this matches the key uploaded in AWS
    host        = self.public_ip
   # timeout     = "2m"
  }
   provisioner "local-exec" {
    command = "touch file500"
  }

  provisioner "file" {
    source      = "file10"
    destination = "/home/ec2-user/file10"
  }

  provisioner "remote-exec" {
    inline = [
      "touch file200",
      "echo hello  AWS * >> file200",
    ]
  }
}
