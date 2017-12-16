resource "aws_key_pair" "hackathon-master" {
  key_name   = "deployer-key"
  public_key = "${file(var.key_file)}"
}