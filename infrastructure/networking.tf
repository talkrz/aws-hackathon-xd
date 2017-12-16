resource "aws_vpc" "hackathon" {
  cidr_block       = "10.0.0.0/16"

  tags {
    Name = "hackathon"
  }
}

resource "aws_subnet" "hackathon_public_a" {
  vpc_id     = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1a"

  tags {
    Name = "hackathon_public_a"
  }
}

resource "aws_subnet" "hackathon_public_b" {
  vpc_id     = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1b"

  tags {
    Name = "hackathon_public_b"
  }
}

resource "aws_subnet" "hackathon_public_c" {
  vpc_id     = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1c"

  tags {
    Name = "hackathon_public_c"
  }
}

resource "aws_subnet" "hackathon_private_a" {
  vpc_id     = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1a"

  tags {
    Name = "hackathon_private_a"
  }
}

resource "aws_subnet" "hackathon_private_b" {
  vpc_id     = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.5.0/24"
  availability_zone = "eu-west-1b"

  tags {
    Name = "hackathon_private_b"
  }
}

resource "aws_subnet" "hackathon_private_c" {
  vpc_id     = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.6.0/24"
  availability_zone = "eu-west-1c"

  tags {
    Name = "hackathon_private_c"
  }
}
