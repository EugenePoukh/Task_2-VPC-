resource "aws_elb" "LOAD_BALANCER" {
	name			= "elastic-load-balancer"
	subnets			= ["${aws_subnet.SUBNET_PRIVATE_1.id}", "${aws_subnet.SUBNET_PRIVATE_2.id}"]
#	availability_zones	= ["${var.A_Z_2}", "${var.A_Z_3}"]
	security_groups 	= ["${aws_security_group.ACCESS.id}"]
	listener {
		instance_port		= 80
		instance_protocol	= "http"
		lb_port			= 80
		lb_protocol		= "http"
	}	


	health_check {
		healthy_threshold	= 2
		unhealthy_threshold     = 2
		timeout			= 3
		target			= "HTTP:80/"
		interval		= 30

}
}
