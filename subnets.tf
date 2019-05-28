resource "aws_subnet" "SUBNET_PUBLIC" {
        vpc_id  = "${aws_vpc.CUSTOM.id}"
        cidr_block = "${var.CIDR_PUBLIC}"
        availability_zone = "${var.A_Z_1}a"
        tags = {
                Name = "SUBNET_PUBLIC"}
}
resource "aws_subnet" "SUBNET_PRIVATE_2" {
        vpc_id  = "${aws_vpc.CUSTOM.id}"
        cidr_block = "${var.CIDR_PRIVATE_1}"
        availability_zone = "${var.A_Z_2}b"
        tags = {
                Name = "SUBNET_PRIVATE_2"}
}
resource "aws_subnet" "SUBNET_PRIVATE_3" {
        vpc_id  = "${aws_vpc.CUSTOM.id}"
        cidr_block = "${var.CIDR_PRIVATE_2}"
        availability_zone = "${var.A_Z_3}c"
        tags = {
                Name = "SUBNET_PRIVATE_3"}
}

