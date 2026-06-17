variable "security_group_name" {
  description = "Security group name"
  type        = string

  validation {
    condition     = length(trim(var.security_group_name, " ")) > 0
    error_message = "security_group_name cannot be empty."
  }
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string

  validation {
    condition     = length(trim(var.availability_zone, " ")) > 0
    error_message = "availability_zone cannot be empty."
  }
}

variable "ingress_rules" {
  description = "Ingress security group rules"

  type = list(object({
    protocol    = string
    from_port   = number
    to_port     = number
    cidr        = string
    description = optional(string)
  }))

  default = []
}
variable "egress_rules" {
  description = "Egress security group rules"

  type = list(object({
    protocol    = string
    from_port   = number
    to_port     = number
    cidr        = string
    description = optional(string)
  }))

  default = []
}
