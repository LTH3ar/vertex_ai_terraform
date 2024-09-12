variable "project_id" {
  type = string
}

variable "region" {
  type = string
  default = "asia-southeast1"
}

variable "zone" {
  type = string
  default = "asia-southeast1-a"
}

variable "vpc_network_name" {
    type = string
    default = "test-vpc"
}

variable "subnet_name" {
    type = string
    default = "test-vpc-vertex-subnet"
}

variable "instance_prefix_name" {
  type = string
  default = "vertex-workbench-instance"
}

variable "tfstate_prefix" {
    type = string
}

variable "isDeleted" {
    type = bool
    default = false
}
# variable "service_account_email" {
#   type = string
# }

variable "user_email" {
  type = string
}

variable "user_name" {
  type = string
}

variable "machine_type" {
  type = string
  default = "e2-standard-4"
}

variable "boot_disk_type" {
    type = string
    default = "PD_STANDARD"
}

variable "boot_disk_size" {
    description = "value in GB"
    type = number
    default = 150
}

variable "data_disk_type" {
    type = string
    default = "PD_STANDARD"
}

variable "data_disk_size" {
    description = "value in GB"
    type = number
    default = 128
}

variable "accelerator_type" {
    type = string
    default = "NVIDIA_TESLA_T4"
}

variable "accelerator_count" {
    type = number
    default = 1
}



