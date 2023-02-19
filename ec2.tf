resource "aws_instance" "jump" {
  ami           = "ami-0533f2ba8a1995cf9"
  instance_type = "t2.micro"
  key_name = "tests"

  subnet_id                   = aws_subnet.jumpsubnet.id
  vpc_security_group_ids      = [aws_security_group.jumpsg.id]
  associate_public_ip_address = true

  user_data = "${file("data1.sh")}"

  tags = {
    "Name" : "jump"
  }
}

resource "aws_instance" "docker" {
  ami           = "ami-0533f2ba8a1995cf9"
  instance_type = "t2.micro"
  key_name = "tests"

  subnet_id                   = aws_subnet.jumpsubnet.id
  vpc_security_group_ids      = [aws_security_group.jumpsg.id]
  associate_public_ip_address = true

  user_data = "${file("data2.sh")}"

  tags = {
    "Name" : "docker"
  }
}