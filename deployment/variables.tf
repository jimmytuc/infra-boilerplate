variable "security_group" {
  type    = "list"
  default = ["sg-id"]
}

variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "us-east-1"
}

variable "aws_vpc" {
  default = "vpc-id"
}

variable "aws_subnets" {
  type = "map"

  default = {
    "app-qa-a"           = "subnet-id-a"
    "app-prod-backend-a" = "subnet-id-b"
  }
}

variable "aws_security_groups" {
  type = "map"

  default = {
    "main" = "sg-id"
  }
}

variable "iam_profile_name" {
  default = "app-ec2-profile"
}

variable "key_names" {
  type = "map"

  default = {
    "qa"         = "qa_ec2_ssh.pem.pub"
    "production" = "prod_ec2_ssh.pem.pub"
  }
}

variable "app_version" {
  default = "latest"
}

variable "env" {}

variable "app_name" {}

variable "instance_name" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "volume_size" {
  default = 8
}

variable "volume_type" {
  default = "gp2"
}
