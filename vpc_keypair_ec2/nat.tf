resource "aws_eip" "nat-eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.cct-gw"]
}

resource "aws_nat_gateway" "cct-nat" {
    allocation_id = "${aws_eip.nat-eip.id}"
    subnet_id = "${aws_subnet.public-1a.id}"
    depends_on = ["aws_internet_gateway.cct-gw"]

    tags = {
      Name = "CCT-natgateway"
  }
 }
