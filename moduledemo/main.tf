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
}

module "dbserver" {
  source = "./db/mysql"
  dbname = "mydbserver"
}

output "dbprivateip" {
  value = module.dbserver.privateip
}