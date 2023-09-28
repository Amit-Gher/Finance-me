provider "aws" {
  region ="ap-south-1"
}  
resource "aws_instance" "Node_Server" {
    ami = "ami-0f5ee92e2d63afc18"
    instance_type = "t2.micro"
    key_name = "Insure-me"
    vpc_security_group_ids =["sg-07731d49e8595b55f"]
connection {
    type        = "ssh"
    user        = "ec2_user"
    private_key = file("./Insure-me.pem")
    host        = self.public_ip
}
provisioner "remote-exec" {
   inline = ["echo 'wait to start instance'"]
}
tags = {
   Name = "Node_Server"
}
provisioner "local-exec" {
   command = "echo ${aws_instance.Node_Server.public_ip} > inventory"
} 
}
