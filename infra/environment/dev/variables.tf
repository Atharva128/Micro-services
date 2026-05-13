variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "region" {
  type = string
}

variable "env" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
}
variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "public_subnet_cidr_block" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidr_block" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
}

variable "db_subnet_cidr_block" {
  description = "The CIDR blocks for the database subnets"
  type        = list(string)
}