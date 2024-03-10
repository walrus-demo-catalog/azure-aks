variable "name" {
  type        = string
  description = "The name of the Azure Kubernetes cluster"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this module should be provisioned"
  default     = "westus"
}
