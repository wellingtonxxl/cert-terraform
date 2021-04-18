provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
    #add an ami available in AWS console
    ami = "ami-0ff8a91507f77f867"
    instance_type = "t2.micro"

    tags = {
        Name = "Web Server"
    }
    depends_on = [aws_instance.myec2db]
}

resource "aws_instance" "myec2db" {
    ami = ""
    instance_type = "t2.micro"

    tags = {
        Name = "DB Server"
    }
}

data "aws_instance" "dbsearch" {
  filter {
      name = "tag:Name"
      values = ["DB Server"]
  }
}

output "dbserver" {
  value = data.aws_instance.dbsearch.availability_zone
}