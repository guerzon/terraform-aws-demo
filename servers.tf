## Query the  latest AMI for Centos 7
data "aws_ami" "centos7" {
    owners      = ["679593333241"]
    most_recent = true
    filter {
        name   = "name"
        values = ["CentOS Linux 7 x86_64 HVM EBS *"]
    }
    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }
}

## SSH Key pair
resource "aws_key_pair" "terraform-demo-sshkey-santino" {
    key_name   = "terraform-demo-sshkey-santino"
    public_key = file("~/.ssh/id_rsa.pub")
	tags = {
        Name = "terraform-demo-sshkey-santino"
	}
}

### Server definitions
# Web server
resource "aws_instance" "terraform-demo-web" {
  ami                    = data.aws_ami.centos7.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.terraform-demo-sshkey-santino.key_name
  subnet_id              = aws_subnet.terraform-demo-snet-web.id
  vpc_security_group_ids = [aws_security_group.terraform-demo-secgrp-webpub.id]
	tags = {
        Name = "terraform-demo-web"
	}
}
# Application server
resource "aws_instance" "terraform-demo-app" {
  ami                    = data.aws_ami.centos7.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.terraform-demo-sshkey-santino.key_name
  subnet_id              = aws_subnet.terraform-demo-snet-app.id
  vpc_security_group_ids = [aws_security_group.terraform-demo-secgrp-app.id]
	tags = {
        Name = "terraform-demo-app"
	}
}
# Database server - Postgresql
resource "aws_instance" "terraform-demo-postgres" {
  ami                    = data.aws_ami.centos7.id
  instance_type          = "t3a.medium"
  key_name               = aws_key_pair.terraform-demo-sshkey-santino.key_name
  subnet_id              = aws_subnet.terraform-demo-snet-db.id
  vpc_security_group_ids = [aws_security_group.terraform-demo-secgrp-db.id]
	tags = {
        Name = "terraform-demo-postgres"
	}
}
# Database server - MySQL
resource "aws_instance" "terraform-demo-mysql" {
  ami                    = data.aws_ami.centos7.id
  instance_type          = "t3a.medium"
  key_name               = aws_key_pair.terraform-demo-sshkey-santino.key_name
  subnet_id              = aws_subnet.terraform-demo-snet-db.id
  vpc_security_group_ids = [aws_security_group.terraform-demo-secgrp-db.id]
	tags = {
        Name = "terraform-demo-mysql"
	}
}
