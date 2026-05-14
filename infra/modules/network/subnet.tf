data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public-subnet" {
  count             = length(var.public_subnet_cidr_block)
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr_block[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.project_name}-${var.env}-public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private-subnet" {
  count             = length(var.private_subnet_cidr_block)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_block[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.project_name}-${var.env}-private-subnet-${count.index}"
  }
}

resource "aws_subnet" "db-subnet" {
  count             = length(var.db_subnet_cidr_block)
  vpc_id            = var.vpc_id
  cidr_block        = var.db_subnet_cidr_block[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.project_name}-${var.env}-db-subnet-${count.index}"
  }
}