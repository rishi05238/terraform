resource "aws_subnet" "public-1a" {
  vpc_id  = "${aws_vpc.cct-vpc.id}"
  cidr_block = "${var.public1_subnet_1_cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  
  tags = {
   Name = "CCT-public-subnet1"
  }
}  

resource "aws_subnet" "public-2b" {
  vpc_id  = "${aws_vpc.cct-vpc.id}"
  cidr_block = "${var.public2_subnet_2_cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
   Name = "CCT-public-sunbet2"
  }
 }

resource "aws_subnet" "private-1a" {
  vpc_id  = "${aws_vpc.cct-vpc.id}"
  cidr_block = "${var.private1_subnet_1_cidr}"
  availability_zone = "us-east-1a"

  tags = {
    Name = "CCT-private-subnet1"
  }
}

resource "aws_subnet" "private-2b" {
  vpc_id  = "${aws_vpc.cct-vpc.id}"
  cidr_block = "${var.private2_subnet_2_cidr}"
  availability_zone = "us-east-1b"
  
  tags = {
    Name = "CCT-private-subnet2"
   }
  } 
