resource "aws_spot_fleet_request" "spot_fleet_request" {

  fleet_type = "${var.fleet_type}"
  iam_fleet_role = "${var.iam_fleet_role}"
  target_capacity = "${var.target_capacity}"
  allocation_strategy = "${var.allocation_strategy}"
  wait_for_fulfillment = "${var.wait_for_fulfillment}"
  instance_interruption_behaviour = "${var.instance_interruption_behaviour}"
  excess_capacity_termination_policy = "${var.excess_capacity_termination_policy}"
  terminate_instances_with_expiration = "${var.terminate_instances_with_expiration}"

  dynamic "launch_specification" {
    iterator = instance_type
    for_each = var.instance_types
    content {
      count = "${var.count}"
      ami = "${var.ami_id}"
      instance_type = instance_type.value
      iam_instance_profile = "${var.iam_instance_profile}"
      associate_public_ip_address = "${var.associate_public_ip_address}"
      vpc_security_group_ids = "${var.vpc_security_group_ids}"
      key_name  = "${var.key_name}"
      subnet_id = "${var.aws_subnets}"
      monitoring = "${var.monitoring}"
      ebs_optimized = "${var.ebs_optimized}"
      user_data = "${var.user_data}"

      root_block_device {
        volume_size = "${var.root_ebs["volume_size"]}"
        volume_type = "${var.root_ebs["volume_type"]}"
      }

      tags = {
        Name = "${var.instance_name}"
        Env = "${var.env}"
        App = "${var.app_name}"
        InstanceType = "spot"
      }
    }
  }
}
