variable "dbname" {
    type = string
}


resource "aws_instance" "myec2db" {
    ami = "ami-0ff8a91507f77f867"
    instance_type = "t2.micro"

    tags = {
        Name = var.dbname
    }
}