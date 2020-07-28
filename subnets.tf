## Demo subnets

# Web tier subnet
resource "aws_subnet" "terraform-demo-snet-web" {
	vpc_id 			        = aws_vpc.terraform-demo-vpc.id
	cidr_block 		        = "10.0.0.0/21"
	map_public_ip_on_launch = "true"
	availability_zone 	    = "eu-central-1a"
	tags = {
        Name = "terraform-demo-snet-web"
	}
}

# Application tier subnet
resource "aws_subnet" "terraform-demo-snet-app" {
	vpc_id 			        = aws_vpc.terraform-demo-vpc.id
	cidr_block 		        = "10.0.8.0/21"
	map_public_ip_on_launch = "false"
	availability_zone 	    = "eu-central-1a"
	tags = {
        Name = "terraform-demo-snet-app"
	}
}

# Database tier subnet
resource "aws_subnet" "terraform-demo-snet-db" {
	vpc_id 			        = aws_vpc.terraform-demo-vpc.id
	cidr_block 		        = "10.0.16.0/21"
	map_public_ip_on_launch = "false"
	availability_zone 	    = "eu-central-1a"
	tags = {
        Name = "terraform-demo-snet-db"
	}
}
