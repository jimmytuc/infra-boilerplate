resource "aws_instance" "app" {
  count         = 1
  ami           = "${data.aws_ami.linux.id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.env == "production" ? var.aws_subnets["prod"] : var.aws_subnets["qa"]}"

  vpc_security_group_ids = [
    "${var.aws_security_groups["main"]}",
  ]

  root_block_device {
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
    delete_on_termination = true
  }

  associate_public_ip_address = true
  iam_instance_profile        = "iam-instance-profile"
  key_name                    = "${var.env == "production" ? var.key_names["prod"] : var.key_names["qa"]}"

  tags {
    Name = "${var.instance_name}"
    App  = "app"
    Env  = "${var.env}"
  }
}
