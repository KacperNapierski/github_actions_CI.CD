terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.13.1"
    }
  }

  cloud {
    organization = "Learning_Corp"

    workspaces {
      name = "github_actions_CI_CD"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  #profile = "default"
}

variable "ami_id" {
  type        = string
  description = "AMI ID"
}


resource "aws_instance" "Staging" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "Staging"
  }
}

output "Staging_dns" {
  value = aws_instance.Staging.public_dns
}
