resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.env}-igw"
  }

}

resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-${var.env}-nat-eip"
  }

}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-subnet[0].id

  tags = {
    Name = "${var.project_name}-${var.env}-nat-gw"
  }

}

resource "aws_route_table" "public-route-table" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.env}-public-route-table"
  }

}

resource "aws_route_table_association" "public-rta" {
  count          = length(aws_subnet.public-subnet)
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table" "private-route-table" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.env}-private-route-table"
  }
}

resource "aws_route_table_association" "private-rta" {
  count          = length(aws_subnet.private-subnet)
  subnet_id      = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table" "db-route-table" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.env}-db-route-table"
  }

}

resource "aws_route_table_association" "db-rta" {
  count          = length(aws_subnet.db-subnet)
  subnet_id      = aws_subnet.db-subnet[count.index].id
  route_table_id = aws_route_table.db-route-table.id
}