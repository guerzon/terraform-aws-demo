## Internet Gateway
resource "aws_internet_gateway" "terraform-demo-igw" {
    vpc_id = aws_vpc.terraform-demo-vpc.id
	tags = {
        Name  = "terraform-demo-igw"
	}
}
