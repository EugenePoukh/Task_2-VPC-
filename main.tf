provider "aws" {
        region                  = "${var.REGION}"
        shared_credentials_file = "${var.CREDENTIALS_FILE}"
        profile                 = "${var.PROFILE}"     
}
resource "aws_instance" "BASTION" {
        ami           = "${lookup(var.AMI,var.REGION)}"
        instance_type = "${var.TYPE}"
        subnet_id = "${aws_subnet.SUBNET_PUBLIC.id}"
        vpc_security_group_ids = ["${aws_security_group.ACCESS.id}"]
        key_name = "${var.KEY}"
        associate_public_ip_address = true
        tags = {
                Environment = "${var.ENVIRONMENT}"}
}

