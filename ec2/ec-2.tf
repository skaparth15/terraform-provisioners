resource "aws_instance" "expense" {
  ami           = data.aws_ami.data-form.id
  instance_type = local.instance_type
  //count = var.count-no
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]

  tags = {
    Name = var.instance_name
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y ",
      "sudo dnf install mysql -y"
    ]
  }
}



