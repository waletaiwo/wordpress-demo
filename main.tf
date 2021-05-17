provider "aws" {
  region = var.region
}


resource "aws_default_vpc" "default" {
}
resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-east-1a"
}
resource "aws_default_subnet" "default_az2" {
  availability_zone = "us-east-1b"
}
resource "aws_default_subnet" "default_az3" {
  availability_zone = "us-east-1c"
}
resource "aws_default_subnet" "default_az4" {
  availability_zone = "us-east-1d"
}
resource "aws_security_group" "wordpress" {
  name        = "allow http and https traffic into wordpress"
  description = "allows web traffic both inbound and outbound"
  vpc_id      = aws_default_vpc.default.id
  ingress {
    description = "Https"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "wordpress" {
  count = var.instance_count

  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.wordpress.id]
}
resource "aws_eip_association" "wordpress" {
  instance_id   = aws_instance.wordpress.0.id
  allocation_id = aws_eip.wordpress.id
}
resource "aws_eip" "wordpress" {
  vpc = true
}

resource "aws_elb" "wordpress" {
  name      = "wordpress-elb"
  subnets   = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id, aws_default_subnet.default_az3.id, aws_default_subnet.default_az4.id]
  instances = [aws_instance.wordpress.0.id,aws_instance.wordpress.1.id]
  security_groups = [aws_security_group.wordpress.id]
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

}