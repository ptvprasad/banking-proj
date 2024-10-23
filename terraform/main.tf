resource "aws_instance" "production" {
  ami                    = "ami-0e86e20dae9224db8"
  key_name               = "asg"
  vpc_security_group_ids = ["sg-0fa119bc6bab10ff8"]  # Directly use the security group ID
  instance_type          = "t2.micro"
  count                  = 1
  tags = {
    Name = "production"
  }
}

resource "aws_instance" "monitor" {
  ami                    = "ami-0e86e20dae9224db8"
  key_name               = "asg"
  vpc_security_group_ids = ["sg-0fa119bc6bab10ff8"]  # Directly use the security group ID
  instance_type          = "t2.micro"
  count                  = 1
  tags = {
    Name = "monitor"
  }
}
