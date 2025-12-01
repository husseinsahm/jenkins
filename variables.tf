variable "vpc_cidr" {
  default = "192.168.0.0/24"
}

variable "public_subnet_cidr" {
  default = "192.168.0.0/24"
}

variable "key_name" {
  description = "AWS Key Pair name"
}