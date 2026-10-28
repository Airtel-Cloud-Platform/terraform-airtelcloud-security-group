output "security_group_id" {
  description = "Numeric security group ID (airtelcloud_security_group.id)."
  value       = airtelcloud_security_group.this.id
}

output "security_group_uuid" {
  description = "Security group UUID."
  value       = airtelcloud_security_group.this.uuid
}

output "security_group_status" {
  description = "Security group status (provider computed)."
  value       = airtelcloud_security_group.this.status
}

output "az_name" {
  description = "Availability zone name (provider computed)."
  value       = airtelcloud_security_group.this.az_name
}

output "az_region" {
  description = "Availability zone region (provider computed)."
  value       = airtelcloud_security_group.this.az_region
}

output "created_at" {
  description = "Creation timestamp (provider computed)."
  value       = airtelcloud_security_group.this.created_at
}

output "updated_at" {
  description = "Last update timestamp (provider computed)."
  value       = airtelcloud_security_group.this.updated_at
}

output "ingress_rule_ids" {
  description = "IDs of airtelcloud_security_group_rule resources created from ingress_rules."
  value       = [for rule in airtelcloud_security_group_rule.ingress : rule.id]
}

output "egress_rule_ids" {
  description = "IDs of airtelcloud_security_group_rule resources created from egress_rules."
  value       = [for rule in airtelcloud_security_group_rule.egress : rule.id]
}

output "security_group" {
  description = "Computed security group attributes from airtelcloud_security_group."
  value = {
    id         = airtelcloud_security_group.this.id
    uuid       = airtelcloud_security_group.this.uuid
    status     = airtelcloud_security_group.this.status
    az_name    = airtelcloud_security_group.this.az_name
    az_region  = airtelcloud_security_group.this.az_region
    created_at = airtelcloud_security_group.this.created_at
    updated_at = airtelcloud_security_group.this.updated_at
  }
}
