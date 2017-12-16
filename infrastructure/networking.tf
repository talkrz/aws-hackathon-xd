resource "aws_vpc" "hackathon" {
  cidr_block       = "10.0.0.0/16"

  tags {
    Name = "hackathon"
  }
}
