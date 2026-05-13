resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.project_name}-${var.env}-my-vpc"
  }
}

module "network" {
  source = "../network"
  vpc_id = aws_vpc.my-vpc.id
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr_block = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  db_subnet_cidr_block = var.db_subnet_cidr_block
  project_name = var.project_name
  env = var.env
}