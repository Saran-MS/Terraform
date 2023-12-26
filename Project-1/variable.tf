variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type = map
  default = {
    public-subnet : "10.0.1.0/24"
    private-subnet: "10.0.2.0/24"
  }
}

variable "key" {}
  
