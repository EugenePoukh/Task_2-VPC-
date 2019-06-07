variable "REGION" {
	default = "eu-central-1"}
variable "KEY" {}
variable "CREDENTIALS_FILE" {
	default = "/home/ec2-user/.aws/credentials"}
variable "PROFILE" {}
variable "TYPE" {
	description = "type of instance"
	default = "t2.micro"}	
variable "AMI" {
        type                    = "map"
        description             = "I added eu-central-1 - Frankfurt,ami-c86c3f23 - centos and eu-west-3 - Paris,ami-0cfbf4f6db41068ac - amazon linux"
	default {
	"eu-central-1" = "ami-c86c3f23"
        "eu-west-3" = "ami-0cfbf4f6db41068ac"}}
#==============================================================
variable "WEB_PORT" {
        description             = "Port for web server"
        default                 = "80"}
variable "SSH" {
        description = "Port for ssh"
        default = "22"}
#=============================================================
variable "CIDR_VPC" {
	description = "CIDR block for the VPC"
	default = "192.168.0.0/16"
}
variable "CIDR_PUBLIC" {
        description = "CIDR block for the subnet"
        default = "192.168.10.0/24"
}
variable "CIDR_PRIVATE_1" {
        description = "CIDR block for the subnet"
        default = "192.168.20.0/24"
}
variable "CIDR_PRIVATE_2" {
        description = "CIDR block for the subnet"
        default = "192.168.30.0/24"
}
#================================================================
variable "ENVIRONMENT" {
	description = "Environment tag"
  	default = "TASK_2"
}
variable "A_Z_1" {
  description = "availability zone to create subnet"
  default = "eu-central-1"
}
variable "A_Z_2" {
  description = "availability zone to create subnet"
  default = "eu-central-1"
}
variable "A_Z_3" {
  description = "availability zone to create subnet"
  default = "eu-central-1"
}

