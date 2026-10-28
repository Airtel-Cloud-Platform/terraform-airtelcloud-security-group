variable "security_group_name" {
  description = "Security group name"
  type        = string

  validation {
    condition     = length(trim(var.security_group_name, " ")) > 0
    error_message = "security_group_name cannot be empty."
  }
}

variable "availability_zone" {
  description = "Availability zone. Optional in the provider."
  type        = string
  default     = null
}

variable "ingress_rules" {
  description = "Ingress rules created as airtelcloud_security_group_rule (direction=ingress). from_port/to_port map to port_range_min/max; cidr maps to remote_ip_prefix."

  type = list(object({
    protocol        = string
    from_port       = number
    to_port         = number
    cidr            = optional(string)
    remote_group_id = optional(string)
    ethertype       = optional(string, "IPv4")
    description     = optional(string)
  }))

  default = []
}

variable "egress_rules" {
  description = "Egress rules created as airtelcloud_security_group_rule (direction=egress)."

  type = list(object({
    protocol        = string
    from_port       = number
    to_port         = number
    cidr            = optional(string)
    remote_group_id = optional(string)
    ethertype       = optional(string, "IPv4")
    description     = optional(string)
  }))

  default = []
}
