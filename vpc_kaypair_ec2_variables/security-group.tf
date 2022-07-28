resource "aws_security_group" "bastion-sg" {
  name = "bastion-inst-sg"
  vpc_id = "${aws_vpc.cct-vpc.id}"
 
  ingress {
    from_port = 22
    to_port  = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
   tags = {
    Name = "bastion-sg"
  }
}

resource "aws_security_group" "private-sg" {
  name = "private-inst-sg"
  vpc_id = "${aws_vpc.cct-vpc.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
    from_port = 8082
    to_port   = 8082
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port  = 22
    protocol = "tcp"
    cidr_blocks = ["182.75.83.2/32"]
  }

  ingress {
    from_port = 22
    to_port  = 22
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
    tags = {
      Name = "Private-inst-sg"
  }
 }

