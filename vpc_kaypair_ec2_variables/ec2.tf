resource "aws_instance" "bastion" {
  ami = "${var.bastion-ami-id}"
  instance_type = "${var.bastion-instancetype}"
  subnet_id = "${aws_subnet.public-1a.id}"
  vpc_security_group_ids = ["${aws_security_group.bastion-sg.id}"]
  associate_public_ip_address = true
  key_name = "${var.bastion-key}"

  connection {
  type = "ssh"
  user = "ubuntu"
  private_key = "${file("/home/ubuntu/nv-bastion.pem")}"
 }
  provisioner "file" {
    source  = "/home/ubuntu/cct-nvirginia.pem"
    destination = "/home/ubuntu/cct-nvirginia.pem"
 }
  tags = {
    Name = "Bastion-Host"
  }
 }


resource "aws_instance" "private-inst" {
  ami = "${var.bastion-ami-id}"
  instance_type = "${var.bastion-instancetype}"
  subnet_id = "${aws_subnet.private-1a.id}"
  vpc_security_group_ids = ["${aws_security_group.private-sg.id}"]
  associate_public_ip_address = false
  key_name = "${var.private-key}"
  root_block_device = {
    volume_type = "gp2"
    volume_size = "50"
  }

   tags = {
     Name = "Private-Inst"
     }
   } 
