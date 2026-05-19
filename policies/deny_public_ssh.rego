package terraform.security

deny[msg] {

  input.resource_type == "aws_security_group"

  input.cidr == "0.0.0.0/0"

  input.port == 22

  msg := "Public SSH access detected"
}
