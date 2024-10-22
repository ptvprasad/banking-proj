resource "aws_security_group" "proj-sg" {
  name        = "proj-sg"
  description = "Allow inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# Ingress rule to allow all inbound traffic
  ingress {
    from_port   = 0
    to_port     = 0  # All ports
    protocol    = "-1"    # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "proj-sg-bf"
  }
}
resource "aws_instance" "production" {
  ami             = "ami-0e86e20dae9224db8"
  key_name        = "jendock"
  security_groups = ["proj-sg"]
  instance_type   = "t2.micro"
  count           = 1
  tags = {
    Name = "jendock"
  }
}

resource "aws_instance" "monitor" {
  ami             = "ami-0e86e20dae9224db8"
  key_name        = "host"
  security_groups = ["proj-sg"]
  instance_type   = "t2.micro"
  count           = 1
  tags = {
    Name = "host"
  }
}
                   