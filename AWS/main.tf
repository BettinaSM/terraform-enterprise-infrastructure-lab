```hcl id="q81fjk"
terraform {
  required_version = ">= 1.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "enterprise_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "enterprise-vpc"
  }
}

resource "aws_security_group" "secure_sg" {
  name        = "secure-security-group"
  description = "Enterprise security group"
  vpc_id      = aws_vpc.enterprise_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_s3_bucket" "secure_logs" {
  bucket = "enterprise-secure-logs"

  tags = {
    Environment = "SecurityLab"
  }
}
resource "aws_iam_role" "security_role" {
  name = "security-audit-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}
