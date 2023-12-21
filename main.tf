provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
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
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"  # Replace with your desired availability zone
  map_public_ip_on_launch = true

  tags = {
    Name = "Vartika-subnetdevops"
  }
}

# Create Secrets Manager Secret
resource "aws_secretsmanager_secret" "secretdevops-1" {
  name = "varhitmohvsdevps23gh"
}

resource "aws_secretsmanager_secret" "secretdevops-2" {
  name = "varhitmohvsdevps23hjk"
}


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
