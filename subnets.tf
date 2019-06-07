resource "aws_subnet" "SUBNET_PUBLIC" {
        vpc_id  = "${aws_vpc.CUSTOM.id}"
        cidr_block = "${var.CIDR_PUBLIC}"
        availability_zone = "${var.A_Z_1}"
#	map_public_ip_on_launch = true
        tags = {
                Name = "SUBNET_PUBLIC"}
}
resource "aws_subnet" "SUBNET_PRIVATE_1" {
        vpc_id  = "${aws_vpc.CUSTOM.id}"
        cidr_block = "${var.CIDR_PRIVATE_1}"
        availability_zone = "${var.A_Z_2}"
        tags = {
                Name = "SUBNET_PRIVATE_1"}
}
resource "aws_subnet" "SUBNET_PRIVATE_2" {
        vpc_id  = "${aws_vpc.CUSTOM.id}"
        cidr_block = "${var.CIDR_PRIVATE_2}"
        availability_zone = "${var.A_Z_3}"
        tags = {
                Name = "SUBNET_PRIVATE_2"}
}

