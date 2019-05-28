resource "aws_vpc" "CUSTOM" {
        cidr_block = "${var.CIDR_VPC}"
	enable_dns_hostnames = true
        tags = {
                Name 	      = "Custom_VPC" 
		Environment   = "${var.ENVIRONMENT}"}
}
resource "aws_internet_gateway" "IGW" {
        vpc_id = "${aws_vpc.CUSTOM.id}"
        tags = {
                Environment = "${var.ENVIRONMENT}"}
}
resource "aws_eip" "ELASTIK" {
        instance = "${aws_instance.BASTION.id}"
        vpc = true
}
resource "aws_nat_gateway" "NAT" {
        subnet_id = "${aws_subnet.SUBNET_PUBLIC.id}"
        allocation_id = "${aws_eip.ELASTIK.id}"
        depends_on = ["aws_internet_gateway.IGW"]
        tags = {
                Environment = "${var.ENVIRONMENT}"}
}

