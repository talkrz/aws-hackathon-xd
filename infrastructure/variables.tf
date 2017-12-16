variable "env" {
    default = "hackathon"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "subnet-public1_cidr" {
    default = "10.0.1.0/24"
}

variable "subnet-public2_cidr" {
    default = "10.0.2.0/24"
}

variable "subnet-public3_cidr" {
    default = "10.0.3.0/24"
}

variable "subnet-private1_cidr" {
    default = "10.0.4.0/24"
}

variable "subnet-private2_cidr" {
    default = "10.0.5.0/24"
}

variable "subnet-private3_cidr" {
    default = "10.0.6.0/24"
}

variable "key_file" {
    default = "keys/example.pub"
}