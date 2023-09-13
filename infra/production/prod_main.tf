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


variable "public_key" {
  description = "Production environment public key value"
  type        = string
}

variable "ami_id" {
  type        = string
  description = "AMI ID"
}

resource "aws_key_pair" "public_key" {
  key_name   = "production-key"
  public_key = var.public_key

  tags = {
    "Name" = "public_key"
  }
}

resource "aws_instance" "Production" {
  ami           = var.ami_id
  instance_type = "t2.micro"


  tags = {
    "Name" = "Production"
  }
}

output "production_dns" {
  value = aws_instance.Production.public_dns
}
