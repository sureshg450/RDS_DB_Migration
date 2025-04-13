variable "rds_vpc" {
  type = string
  default = "vpc-0dc187be352770809"
}

variable "ec2_sg" {
    type = string
}

variable "subnet_ids" {
    type = list(string)
    default = ["subnet-028d9d98969ea29e0", "subnet-07ec62c8d0b7062ae"]
}

variable "allocated_storage" {
  type = number
}

variable "db_name" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}