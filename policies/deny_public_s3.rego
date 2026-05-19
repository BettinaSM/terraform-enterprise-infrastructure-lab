package terraform.security

deny[msg] {

  input.resource_type == "aws_s3_bucket"

  input.public == true

  msg := "Public S3 bucket detected"
}
