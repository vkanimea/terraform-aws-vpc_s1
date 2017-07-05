# terraform-aws-vpc

This repository contains a [Terraform][] project that builds [Scenario 1: VPC
with Public Subnets][scenario_one] from the [AWS documentation][].
This scenario is a host that has a public subnet with security port access for a web server (80,443,22 inbound) (all outbound).

## Usage

`terraform.tfvars` holds variables which should be overriden with valid ones.

### Plan

```
terraform plan -var-file terraform.tfvars
```

### Apply

```
terraform apply -var-file terraform.tfvars
```

### Destroy

```
terraform destroy -var-file terraform.tfvars
```
### Use

amend terraform.tfvars with own AWS access, secret, keyname
```
aws_access_key = "xxxx"
aws_secret_key = "xxxx"
aws_key_path = "~/.ssh/aws.pem"
aws_key_name = "xxxx"
```
amend public.tf  - amend with own availability_zone eg. in ap-southeast-2a, subnet_id
```
resource "aws_instance" "web-1" {
availability_zone = "ap-southeast-2a"   
instance_type = "t2.micro"    # for testing purposes use a t2 micro instance
subnet_id = "${aws_subnet.ap-southeast-2a-public.id}"
```

amend variables.tf - amend with default aws_region, amis - image type eg. current ubuntu version
```
variable "aws_region" {
default = "ap-southeast-2"
variable "amis" {
ap-southeast-2 = "ami-96666ff5"" # ubuntu 16.04 LTS
```
amend vpc.tf - amend as shown these a few below
```

resource "aws_subnet" "ap-southeast-2a-public" {
    availability_zone = "ap-southeast-2a"
```


## Author

Copyright (c) 2015 Nick Charlton <nick@nickcharlton.net>. MIT Licensed.

[Terraform]: http://terraform.io
[scenario_two]: http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html
[AWS documentation]: http://aws.amazon.com/documentation/
[blog_post]: https://nickcharlton.net/posts/terraform-aws-vpc.html
