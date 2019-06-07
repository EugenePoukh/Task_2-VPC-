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
                Environment = "${var.ENVIRONMENT}"
		Name	    = "Bastion instance"}
}
resource "aws_instance" "MYSQL" {
        ami           = "${lookup(var.AMI,var.REGION)}"
        instance_type = "${var.TYPE}"
        subnet_id = "${aws_subnet.SUBNET_PRIVATE_2.id}"
        vpc_security_group_ids = ["${aws_security_group.ACCESS.id}"]
        key_name = "${var.KEY}"
        tags = {
		role	    = "mysql"
                Environment = "${var.ENVIRONMENT}"}
}
resource "aws_launch_configuration" "ASG_LAUNCH" {
	image_id	= "${lookup(var.AMI,var.REGION)}"
	instance_type	= "${var.TYPE}"
	security_groups	= ["${aws_security_group.ACCESS.id}"]
}
resource "aws_autoscaling_group" "ASG" {
	launch_configuration	= "${aws_launch_configuration.ASG_LAUNCH.id}"
	min_size		= 2
	max_size		= 2
	
	tag {
		key			= "role"	
		value			= "app"
		propagate_at_launch	= true
	}
}
