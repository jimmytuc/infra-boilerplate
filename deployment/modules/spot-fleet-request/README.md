# Spot fleet request instance

## Terraform version
- v0.12

## Required vars
### Instance and Spot fleet attributes:
- root_ebs: map
- count: string
- key_name: string
- aws_subnets: string
- aws_region: string
- ami_id: string
- iam_fleet_role: string
- iam_instance_profile: string
- target_capacity: string
- allocation_strategy: string
- instance_interruption_behaviour: string
- excess_capacity_termination_policy: string
- user_data: string
- monitoring: boolean
- ebs_optimized: boolean
- associate_public_ip_address: boolean
- wait_for_fulfillment: boolean
- vpc_security_group_ids: map

### Environments:
- instance_type: string
- image_tag: string
- instance_name: string
- app_name: string
- env: string
- newrelic_license: string

## Usage
```module "aws_spotfleet_request" {
    source = "terraform-modules/spot-fleet-request"
    env = "${var.env}"
    key_name = "${var.key_name}"
    iam_fleet_role = "${var.iam_fleet_role}"
    image_tag = "${var.image_tag}"
    instance_name = "${var.instance_name}"
    app_name = "${var.app_name}"
    ami_id = "${data.aws_ami.linux.id}"
    newrelic_license = "${var.newrelic_license}"
    instance_types = "${var.instance_types}"
    vpc_security_group_ids = ["${var.aws_security_groups["backend-pro"]}"]
    aws_subnets = "${var.aws_subnets}"

}```
Refer: https://www.terraform.io/docs/modules/sources.html
