provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = ""
    instance_type = "t2.micro"

    tags = {
        Name = "Web Server"
    }
    depends_on = ["aws_instance.myec2db"]
}

resource "aws_instance" "myec2db" {
    ami = ""
    instance_type = "t2.micro"

    tags = {
        Name = "DB Server"
    }
}