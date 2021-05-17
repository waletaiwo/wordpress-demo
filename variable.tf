variable "region" {
  type        = string
  description = "aws region"
}
variable "instance_ami" {
  type        = string
  description = "wordpress instance ami"
}
variable "instance_type" {
  type        = string
  description = "instance type for wordpress"
}
variable "instance_count" {
  type        = number
  description = "number of ec2 instances to deploy"
}