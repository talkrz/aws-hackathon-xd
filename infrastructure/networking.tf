###########
### VPC ###
###########

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name        = "${format("%s-%s", "vpc", var.env)}"
    Environment = "${var.env}"
  }
}

########################
### INTERNET DEVICES ###
########################

resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${format("%s-%s", "ig", var.env)}"
    Environment = "${var.env}"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.nat-gateway1-eip.id}"
  subnet_id     = "${aws_subnet.subnet-public1.id}"
}

######################
### PUBLIC SUBNETS ###
######################

resource "aws_subnet" "subnet-public1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet-public1_cidr}"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags {
    Name        = "${format("%s-%s", "subnet-public1", var.env)}"
    Environment = "${var.env}"
  }
}

resource "aws_subnet" "subnet-public2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet-public2_cidr}"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true

  tags {
    Name        = "${format("%s-%s", "subnet-public2", var.env)}"
    Environment = "${var.env}"
  }
}

resource "aws_subnet" "subnet-public3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet-public3_cidr}"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = true

  tags {
    Name        = "${format("%s-%s", "subnet-public3", var.env)}"
    Environment = "${var.env}"
  }
}

#######################
### PRIVATE SUBNETS ###
#######################

resource "aws_subnet" "subnet-private1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet-private1_cidr}"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = false

  tags {
    Name        = "${format("%s-%s", "subnet-private1", var.env)}"
    Environment = "${var.env}"
  }
}

resource "aws_subnet" "subnet-private2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet-private2_cidr}"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = false

  tags {
    Name        = "${format("%s-%s", "subnet-private2", var.env)}"
    Environment = "${var.env}"
  }
}

resource "aws_subnet" "subnet-private3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet-private3_cidr}"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = false

  tags {
    Name        = "${format("%s-%s", "subnet-private3", var.env)}"
    Environment = "${var.env}"
  }
}

#############################
### ROUTE TABLES - PUBLIC ###
#############################

resource "aws_route_table" "rt-public1" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }

  tags {
    Name        = "${format("%s-%s", "rt-public1", var.env)}"
    Environment = "${var.env}"
  }
}

resource "aws_route_table_association" "rt-asso-public1" {
  subnet_id      = "${aws_subnet.subnet-public1.id}"
  route_table_id = "${aws_route_table.rt-public1.id}"
}

resource "aws_route_table_association" "rt-asso-public2" {
  subnet_id      = "${aws_subnet.subnet-public2.id}"
  route_table_id = "${aws_route_table.rt-public1.id}"
}

resource "aws_route_table_association" "rt-asso-public3" {
  subnet_id      = "${aws_subnet.subnet-public3.id}"
  route_table_id = "${aws_route_table.rt-public1.id}"
}

##############################
### ROUTE TABLES - PRIVATE ###
##############################

resource "aws_route_table" "rt-private1" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
  }

  tags {
    Name        = "${format("%s-%s", "rt-private1", var.env)}"
    Environment = "${var.env}"
  }
}

resource "aws_route_table_association" "rt-asso-private1" {
  subnet_id      = "${aws_subnet.subnet-private1.id}"
  route_table_id = "${aws_route_table.rt-private1.id}"
}

resource "aws_route_table_association" "rt-asso-private2" {
  subnet_id      = "${aws_subnet.subnet-private2.id}"
  route_table_id = "${aws_route_table.rt-private1.id}"
}

resource "aws_route_table_association" "rt-asso-private3" {
  subnet_id      = "${aws_subnet.subnet-private3.id}"
  route_table_id = "${aws_route_table.rt-private1.id}"
}

###################
### ELASTIC IPS ###
###################

resource "aws_eip" "nat-gateway1-eip" {
  vpc = true
}

###############
### OUTPUTS ###
###############

output "vpc-id" {
  value = "${aws_vpc.vpc.id}"
}

output "subnet-public1-id" {
  value = "${aws_subnet.subnet-public1.id}"
}

output "subnet-public2-id" {
  value = "${aws_subnet.subnet-public2.id}"
}

output "subnet-public3-id" {
  value = "${aws_subnet.subnet-public3.id}"
}

output "subnet-private1-id" {
  value = "${aws_subnet.subnet-private1.id}"
}

output "subnet-private2-id" {
  value = "${aws_subnet.subnet-private2.id}"
}

output "subnet-private3-id" {
  value = "${aws_subnet.subnet-private3.id}"
}