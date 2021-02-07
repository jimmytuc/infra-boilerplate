#
# Variables Configuration
#
variable "region" {
  default = "ap-southest-1"
  type    = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.18"
}

variable "workers_count" {
  default = 2
}

variable "workers_type" {
  type    = string
  default = "t3a.small"
}
