## Route table
resource "aws_route_table" "terraform-demo-rtable" {
    vpc_id = aws_vpc.terraform-demo-vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.terraform-demo-igw.id
	}
	tags = {
		Name = "terraform-demo-rtable"
	}
}

# Route table associations
resource "aws_route_table_association" "terraform-demo-rtassoc1" {
    subnet_id      = aws_subnet.terraform-demo-snet-web.id
	route_table_id = aws_route_table.terraform-demo-rtable.id
}
resource "aws_route_table_association" "terraform-demo-rtassoc2" {
    subnet_id 	   = aws_subnet.terraform-demo-snet-app.id
	route_table_id = aws_route_table.terraform-demo-rtable.id
}
resource "aws_route_table_association" "terraform-demo-rtassoc3" {
    subnet_id 	   = aws_subnet.terraform-demo-snet-db.id
	route_table_id = aws_route_table.terraform-demo-rtable.id
}
