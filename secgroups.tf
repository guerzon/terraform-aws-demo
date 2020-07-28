## Security groups

# Web tier security group
resource "aws_security_group" "terraform-demo-secgrp-webpub" {
	vpc_id		    = aws_vpc.terraform-demo-vpc.id
	name		    = "terraform-demo-secgrp-webpub"
	description	    = "Allow web traffic from the internet"
	ingress{
        from_port	= 80
		to_port		= 80
		protocol	= "tcp"
		cidr_blocks	= ["0.0.0.0/0"]
		description = "Plain HTTP"
	}
	ingress{
        from_port	= 443
		to_port		= 443
		protocol	= "tcp"
		cidr_blocks	= ["0.0.0.0/0"]
		description = "Secure HTTP"
	}
	egress {
        from_port	= 0
		to_port		= 0
		protocol	= "-1"
		cidr_blocks	= ["0.0.0.0/0"]
	}
	tags = {
        Name = "terraform-demo-secgrp-webpub"
	}
}

# Application tier security group
resource "aws_security_group" "terraform-demo-secgrp-app" {
	vpc_id		    = aws_vpc.terraform-demo-vpc.id
	name		    = "terraform-demo-secgrp-app"
	description	    = "Allow traffic from the web tier"
	ingress{
        from_port	= 8080
		to_port		= 8080
		protocol	= "tcp"
		cidr_blocks	= ["10.0.0.0/21"]
		description = "Plain HTTP"
	}
	ingress{
        from_port	= 8443
		to_port		= 8443
		protocol	= "tcp"
		cidr_blocks	= ["10.0.0.0/21"]
		description = "Secure HTTP"
	}
	egress {
        from_port	= 0
		to_port		= 0
		protocol	= "-1"
		cidr_blocks	= ["0.0.0.0/0"]
	}
	tags = {
        Name = "terraform-demo-secgrp-app"
	}
}

# Database tier security group
resource "aws_security_group" "terraform-demo-secgrp-db" {
	vpc_id		    = aws_vpc.terraform-demo-vpc.id
	name		    = "terraform-demo-secgrp-db"
	description	    = "Allow traffic from the app tier"
	ingress{
        from_port	= 5432
		to_port		= 5432
		protocol	= "tcp"
		cidr_blocks	= ["10.0.8.0/21"]
		description = "PostgreSQL"
	}
	ingress{
        from_port	= 3306
		to_port		= 3306
		protocol	= "tcp"
		cidr_blocks	= ["10.0.8.0/21"]
		description = "MySQL"
	}
	ingress{
        from_port	= 27017
		to_port		= 27017
		protocol	= "tcp"
		cidr_blocks	= ["10.0.8.0/21"]
		description = "mongodb"
	}
	egress {
        from_port	= 0
		to_port		= 0
		protocol	= "-1"
		cidr_blocks	= ["0.0.0.0/0"]
	}
	tags = {
        Name = "terraform-demo-secgrp-db"
	}
}
