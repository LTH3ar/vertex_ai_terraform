variable "project_id" {
  type = string
  default = "dark-quasar-435302-s7"
}

variable "region" {
  type = string
  default = "asia-southeast1"
}

variable "zone" {
  type = string
  default = "asia-southeast1-a"
}

# VPC Network Variables

variable "vpc_network_name" {
  type        = string
  default     = "test-vpc"
}

variable "subnet_ip_cidr_range" {
  type        = string
  default     = "10.0.0.0/21"
}