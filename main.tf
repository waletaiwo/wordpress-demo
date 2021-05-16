provider "aws" {
  region = var.region
}


resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "wordpress" {
  name        = "allow http and https traffic into wordpress"
  description = "allows web traffic both inbound and outbound"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "Https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
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
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.wordpress.id]
}
