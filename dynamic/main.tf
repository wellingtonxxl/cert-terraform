provider "aws" {
  region = "us-east-1"
}

variable "ingress_rules" {
  type = list(number)
  default = [25, 80, 443, 8080, 8443]
}

variable "egress_rules" {
  type = list(number)
  default = [443, 8443]
}

resource "aws_instance" "myec2ws" {
    ami = "ami-0ff8a91507f77f867"   
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.web_traffic.name ]
    tags = {
        Name = "Web Server"
    } 
}

resource "aws_security_group" "web_traffic" {
    name = "Secure Server"
    dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

  }

    dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
