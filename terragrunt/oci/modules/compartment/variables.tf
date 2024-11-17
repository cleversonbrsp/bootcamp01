variable "compartment_name" {
  type        = string
  description = "bootcamp1"
}

variable "compartment_description" {
  type        = string
  description = "Description of the compartment."
  default     = "Compartment for bootcamp1 resources"
}

variable "compartment_id" {
  type        = string
  description = "ID of the parent compartment."
}

variable "region" {
  default = "sa-saopaulo-1"
}