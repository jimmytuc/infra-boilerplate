data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ami-docker-image"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["123456789"]
}
