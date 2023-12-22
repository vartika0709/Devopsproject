provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}
terraform {
  backend "s3" {
    bucket = "devopstfstate"
    key    = "tf/terraform.tfstate"
    region = "us-east-1"
  }
}

# Create VPC
resource "aws_vpc" "vpcdevops" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Vartika-vpcdevops"
  }
}

# Create Subnet
resource "aws_subnet" "subnetdevops" {
  vpc_id                  = aws_vpc.vpcdevops.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"  # Replace with your desired availability zone
  map_public_ip_on_launch = true

  tags = {
    Name = "Varhit1-subnetdevops1"
  }
}

# Create Secrets Manager Secret
resource "aws_secretsmanager_secret" "secretdevops-1" {
  name = "vanisthanewscrtsecret"
}

#resource "aws_secretsmanager_secret" "secretdevops-2" {
#  name = "varhitmohvsdevps23hjk"
#}

#resource "aws_secretsmanager_secret_version" "my_secret_version" {
#  secret_id     = aws_secretsmanager_secret.secretdevops-1.id
#  secret_string = jsonencode(var.example)
#}


# Create S3 Bucket
resource "aws_s3_bucket" "vartikabucketdevops" {
  bucket = "varhitvsabucket-devops"  # Replace with your desired bucket name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "varhitnewvsbucketdevops"
  }
}
