resource "null_resource" "provisioning" {
  triggers {
    uuid = "${uuid()}"
  }

  connection {
    host = "${aws_instance.app.public_ip}"
    type = "ssh"
    user = "ec2-user"
    agent = true
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /app/logs/",
      "sudo chown -R ec2-user:ec2-user /app/",
    ]
  }
}
