# Default vars
variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = "us-east-1"
}

variable "associate_public_ip_address" {
  default = true
}

variable "target_capacity" {
  default = "1"
  type = "string"
  description = "The number of units to request"
}

variable "allocation_strategy" {
  default = "lowestPrice"
  type = "string"
  description = "Indicates how to allocate the target capacity across the Spot pools specified by the Spot fleet request. Default is lowestPrice"
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "root_ebs" {
  type = "map"
  default = {
    "volume_size" = "8"
    "volume_type" = "gp2"
  }
}

variable "instance_interruption_behaviour" {
  type = "string"
  default = "terminate"
}

variable "wait_for_fulfillment" {
  default = true
}

variable "excess_capacity_termination_policy" {
  default = "Default"
  description = "expected excess_capacity_termination_policy to be one of [Default NoTermination]"
}

variable "terminate_instances_with_expiration" {
  default = true
  description = "Indicates whether running Spot instances should be terminated when the Spot fleet request expires."
}

variable "fleet_type" {
  default = "request"
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
}

# required vars
variable "key_name" {
  type = "string"
  description = "Specify SSH keys for logging to the instance"
}

variable "aws_subnets" {
  type = "string"
  default = "subnet-a, subnet-b, subnet-c"
  description = "default is QA env subnets, if production env please specify subnet at application."
}

variable "count" {
  default = "1"
}

variable "iam_fleet_role" {
  description = "Grants the Spot fleet permission to terminate Spot instances"
}
variable "instance_types" {
  type = list(string)
  description = "list of instance types"
}
variable "iam_instance_profile" {}
variable "ami_id" {}
variable "image_tag" {}
variable "instance_name" {}
variable "app_name" {}
variable "env" {}
variable "vpc_security_group_ids" {}
