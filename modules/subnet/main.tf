resource "aws_subnet" "myapp-subnet-1" {
  vpc_id = var.vpc_id
  cidr_block = var.subnet_cidr_blocks
  availability_zone = var.avail_zone
  tags = {
    Name: "${var.env_prefix}-vpc-subnet-1"
  }
}

# create a new route table 
# resource "aws_route_table" "myapp-route-table"  {
#   vpc_id = var.vpc_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.myapp-ig.id
#   }

#   tags = {
#     Name: "${var.env_prefix}-rtb"
#   }
# }

# resource "aws_route_table_association" "a-rtb-subnet" {
#   subnet_id = aws_subnet.myapp-subnet-1.id
#   route_table_id = aws_route_table.myapp-route-table.id
# }

# use auto generated table
resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = var.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-ig.id
  }

  tags = {
    Name: "${var.env_prefix}-main-rtb"
  }
} 

resource "aws_internet_gateway" "myapp-ig" {
  vpc_id = var.vpc_id

  tags = {
    Name: "${var.env_prefix}-igw"
  }
}