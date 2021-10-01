variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "environment" {
  type        = string
  description = "Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT'"
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
  default     = {}
}

variable "public_key" {
  description = "path of public key"
  type        = string
}

variable "private_key" {
  type        = string
  description = "private key"
}
