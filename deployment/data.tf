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

data "template_file" "script" {
  template = file("${path.module}/init.tpl")

  vars {
    consul_address = "${aws_instance.consul.private_ip}"
  }
}

# Render a multi-part cloud-init config making use of the part
# above, and other source files
# check https://ash.berlintaylor.com/writings/2017/08/reusable-terraform-modules-extending-userdata/
data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.script.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "baz"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "ffbaz"
  }

  part {
    filename     = "init.sh"
    content_type = "text/x-shellscript"
    content      = "echo Hi\ntouch /root/There\n"
  }
}
