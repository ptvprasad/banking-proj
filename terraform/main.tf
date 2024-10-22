data "aws_security_group" "proj_sg" {
  filter {
    name   = "group-name"
    values = ["proj-sg"]
  }
}

resource "aws_instance" "prodc"{
  ami             = "ami-0e86e20dae9224db8"
  key_name        = "jendock"
  security_groups = [data.aws_security_group.proj_sg.id]
  instance_type   = "t2.micro"
  count           = 1
  tags = {
    Name = "prodk"
  }
}

resource "aws_instance" "monitorc"{
  ami             = "ami-0e86e20dae9224db8"
  key_name        = "host"
  security_groups = [data.aws_security_group.proj_sg.id]
  instance_type   = "t2.micro"
  count           = 1
  tags = {
    Name = "monitorchk"
  }
}

output "security_group_id" {
  value = data.aws_security_group.proj_sg.id
}
