terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.66.0"
    }
  }
  backend "s3" {
    bucket = "myremotebackend-vrk"
    key = "mytestenv/terraform.tfstate"
    region = "ap-south-1"
    
  }
}

provider "aws" {
    region = "ap-south-1"
}



resource "aws_instance" "mytestservers" {
    ami = "ami-066c4849e6b3a1e3d"
    availability_zone = "ap-south-1a"
    key_name = "mumbai"
    instance_type = "t3.micro"
    tags = {
      Name = "vrktestserver-${count.index + 1}"
      env = "devteam1"
    }
    count = 3
  
}

