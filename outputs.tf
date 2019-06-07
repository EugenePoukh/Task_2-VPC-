output "bastion_public_ip" {
	value = "${aws_instance.BASTION.public_ip}"
}
output "NAT_IP" {
	value = "${aws_eip.ELASTIK.public_ip}"
}
