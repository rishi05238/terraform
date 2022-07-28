resource "aws_vpc" "cct-vpc" {
   cidr_block = "${var.vpc_cidr}"

   tags = {
     Name = "${var.vpc_name}"
  }
 }

