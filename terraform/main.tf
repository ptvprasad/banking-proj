resource "aws_security_group" "proj-sgt" {
  name        = "proj-sgt"
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
    Name = "proj-sg-bft"
  }
}
resource "aws_instance" "prodc" {
  ami             = "ami-0e86e20dae9224db8"
  key_name        = "jendock"
  security_groups = ["proj-sgt"]
  instance_type   = "t2.micro"
  count           = 1
  tags = {
    Name = "prodk"
  }
}

resource "aws_instance" "monitorc" {
  ami             = "ami-0e86e20dae9224db8"
  key_name        = "host"
  security_groups = ["proj-sgt"]
  instance_type   = "t2.micro"
  count           = 1
  tags = {
    Name = "monitorchk"
  }
}
                   
