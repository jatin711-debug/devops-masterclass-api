variable "vpc_cidr" {
  description = "value of the VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "value of the VPC name"
  type        = string
  default     = "webserver-cluster-vpc"
}

variable "subnet_cidr_1" {
  description = "value of the subnet CIDR"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet_cidr_2" {
  description = "value of the subnet CIDR"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet_cidr_3" {
  description = "value of the subnet CIDR"
  type        = string
  default     = "10.0.0.0/24"
}

variable "cluster_name" {
  description = "value of the cluster name"
  type        = string
  default     = "webserver-cluster"
}
