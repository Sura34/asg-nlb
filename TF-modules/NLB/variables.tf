variable "deployment_name" {
  description = "Deployment name "
  default     = "artifactory"
}

variable "node_size" {
  description = "Deployment name "
  default     = "2"
}

variable "node_min" {
  description = "Deployment name "
  default     = "2"
}

variable "node_max" {
  description = "Deployment name "
  default     = "2"
}

variable "subnet" {
  description = "Deployment name "
  default     = [SUBNET_NAME]
}