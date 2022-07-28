resource "aws_internet_gateway" "cct-gw" {
    vpc_id = "${aws_vpc.cct-vpc.id}"

    tags  = {
      Name = "cct-internet-gateway"
    }
   }


    
