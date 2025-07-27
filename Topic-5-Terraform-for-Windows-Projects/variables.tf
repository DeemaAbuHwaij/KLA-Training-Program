
variable "aws_region" {
  default = "us-west-1"
}

variable "windows_ami" {
  description = "AMI ID of Windows Server"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "key_name" {
  description = "EC2 Key Pair name"
}

variable "vpc_id" {}
variable "subnet_id" {}