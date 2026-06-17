output "security_group_id" {
  description = "Security Group ID"

  value = airtelcloud_security_group.this.id
}

output "security_group_uuid" {
  description = "Security Group UUID"

  value = airtelcloud_security_group.this.uuid
}

output "security_group_status" {
  description = "Security Group Status"

  value = airtelcloud_security_group.this.status
}

output "ingress_rule_ids" {
  description = "Ingress rule IDs"

  value = [
    for rule in airtelcloud_security_group_rule.ingress : rule.id
  ]
}

output "egress_rule_ids" {
  description = "Egress rule IDs"

  value = [
    for rule in airtelcloud_security_group_rule.egress : rule.id
  ]
}

output "security_group" {
  description = "Complete security group object"

  value = {
    id     = airtelcloud_security_group.this.id
    uuid   = airtelcloud_security_group.this.uuid
    status = airtelcloud_security_group.this.status
  }
}
