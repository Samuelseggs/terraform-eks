provider "aws" {
    region = "us-east-1"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

data "aws_availability_zones" "azs" {
    state = "available"
}

terraform {
  cloud {
    organization = "rewind24"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "terraform-eks"
    }
  }
}