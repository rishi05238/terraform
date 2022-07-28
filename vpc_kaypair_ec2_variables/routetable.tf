resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.cct-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.cct-gw.id}"
}
  tags = {
    Name = "CCT-Public-route"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.cct-gw.id}"
}

resource "aws_route_table" "private" {
    vpc_id = "${aws_vpc.cct-vpc.id}"
    
    tags = {
      Name = "CCT-Private-route"
  }
}

resource "aws_route" "private_route" {
  route_table_id  = "${aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.cct-nat.id}"
}

resource "aws_route_table_association" "public-1a" {
  subnet_id = "${aws_subnet.public-1a.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public-2b" {
  subnet_id = "${aws_subnet.public-2b.id}"
  route_table_id = "${aws_route_table.public.id}"
}


resource "aws_route_table_association" "private-1a" {
  subnet_id = "${aws_subnet.private-1a.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private-2b" {
  subnet_id = "${aws_subnet.private-2b.id}"
  route_table_id = "${aws_route_table.private.id}"
}
