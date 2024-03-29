variable "ami" {
  type    = string
  default = "ami-0d77c9d87c7e619f9"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instances" {
  type    = list(string)
  default = ["server1", "server2", "server3"]
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
  for_each      = toset(var.instances)
  tags = {
    Name = each.value 
    # for a set, each.value and each.key is the same
  }
}
