variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "ap-southeast-2"
}
# http://cloud-images.ubuntu.com/locator/ec2/
variable "amis" {
    description = "AMIs by region"
    default = {
        # ap-southeast-2 = "ami-47726224" # ubuntu 16.04 LTS - only allows m1.small upwards
        ap-southeast-2 = "ami-96666ff5" # ubuntu 16.04 LTS    # Free option 
    }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}
