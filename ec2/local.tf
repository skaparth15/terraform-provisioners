locals {
  image-id = "ami-031d574cddc5bb371"
  
  sg-id = "sg-0ef48e55b500fa807"
  instance_type= var.instance_name== "database"? "t3.micro" : "t2.micro"
}

output "instance-info" {
 value = aws_instance.expense
}