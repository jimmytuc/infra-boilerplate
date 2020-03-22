output "instance_public_ip" {
  value = "${data.aws_instances.spot_fleet_request.public_ips}"
}

output "spot_request_state" {
  value = "${aws_spot_fleet_request.spot_fleet_request.spot_request_state}"
}

output "spot_instance_id" {
  value = "${aws_spot_fleet_request.spot_fleet_request.id}"
}
