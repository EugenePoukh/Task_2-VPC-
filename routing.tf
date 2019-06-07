#=============Public===============
resource "aws_route_table" "PUBLIC_ROUTE_TABLE"{
        vpc_id = "${aws_vpc.CUSTOM.id}"
        route {
                cidr_block = "0.0.0.0/0"
                gateway_id = "${aws_internet_gateway.IGW.id}"
                }
        tags = {
                Environment = "${var.ENVIRONMENT}"
                Name        = "Public route table"
        }
}
resource "aws_route" "TO_INTERNET" {
        route_table_id          = "${aws_vpc.CUSTOM.main_route_table_id}"
        destination_cidr_block  = "0.0.0.0/0"
        gateway_id              = "${aws_internet_gateway.IGW.id}"
}

#===============Private=============

resource "aws_route_table" "PRIVATE_ROUTE_TABLE"{
        vpc_id = "${aws_vpc.CUSTOM.id}"
        tags = {
                Environment = "${var.ENVIRONMENT}"
                Name        = "Private route table"
        }
}
resource "aws_route" "PRIVATE_ROUTE" {
        route_table_id          = "${aws_route_table.PRIVATE_ROUTE_TABLE.id}"
        destination_cidr_block  = "0.0.0.0/0"
        nat_gateway_id          = "${aws_nat_gateway.NAT.id}"
}
resource "aws_route_table" "PRIVATE_ROUTE_TABLE_2"{
        vpc_id = "${aws_vpc.CUSTOM.id}"
        tags = {
                Environment = "${var.ENVIRONMENT}"
                Name        = "Private route table 2"
        }
}
resource "aws_route" "PRIVATE_ROUTE_2" {
        route_table_id          = "${aws_route_table.PRIVATE_ROUTE_TABLE_2.id}"
        destination_cidr_block  = "0.0.0.0/0"
        nat_gateway_id          = "${aws_nat_gateway.NAT.id}"
}

#==============Route table associations

resource "aws_route_table_association" "PUBLIC_SUBNET_ASSOCIATION" {
	subnet_id	= "${aws_subnet.SUBNET_PUBLIC.id}"
	route_table_id	= "${aws_vpc.CUSTOM.main_route_table_id}"
}

resource "aws_route_table_association" "PRIVATE_SUBNET_ASSOCIATION" {
        subnet_id       = "${aws_subnet.SUBNET_PRIVATE_1.id}"
        route_table_id  = "${aws_route_table.PRIVATE_ROUTE_TABLE.id}"
}
resource "aws_route_table_association" "PRIVATE_SUBNET_2_ASSOCIATION" {
        subnet_id       = "${aws_subnet.SUBNET_PRIVATE_2.id}"
        route_table_id  = "${aws_route_table.PRIVATE_ROUTE_TABLE_2.id}"
}

