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
variable "image_id" {
  type        = string
  description = "launch tempalte image id"
}
variable "desired_capacity" {
  type        = number
  description = "desired instance wanted"
}
variable "max_size" {
  type        = number
  description = "maximum amount of instance runnung"
}
variable "min_size" {
  type        = number
  description = "minimum amount of instance runnung"
}