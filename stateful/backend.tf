terraform {
    backend "s3" {
        bucket = "nome-do-bucket"
        key = "state/terraform.tfstate"
        region = "us-east-1"
    }
}