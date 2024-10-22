resource "aws_instance" "prodc" {
  ami             = "ami-0e86e20dae9224db8"
  key_name        = "jendock"
  security_groups = ["sg-0261b64ca7b80708e"]  # Replace with your actual security group ID
  instance_type   = "t2.micro"
  count           = 1
  tags = {
    Name = "prodk"
  }
}

resource "aws_instance" "monitorc" {
  ami             = "ami-0e86e20dae9224db8"
  key_name        = "host"
  security_groups = ["sg-0261b64ca7b80708e"]  # Replace with your actual security group ID
  instance_type   = "t2.micro"
  count           = 1
  tags = {
    Name = "monitorchk"
  }
}
