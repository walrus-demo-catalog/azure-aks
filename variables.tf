variable "name" {
  type        = string
  description = "The name of the Azure Kubernetes cluster"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this module should be provisioned"
  default     = "westus"
}

variable "principal_id" {
  type        = string
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Cluster Managed Role Definition to"
}