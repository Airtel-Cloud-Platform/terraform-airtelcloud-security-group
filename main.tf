resource "airtelcloud_security_group" "this" {
  security_group_name = var.security_group_name
  availability_zone   = var.availability_zone
}

resource "airtelcloud_security_group_rule" "ingress" {
  for_each = {
    for idx, rule in var.ingress_rules :
    idx => rule
  }

  security_group_id = airtelcloud_security_group.this.id

  direction = "ingress"

  protocol = each.value.protocol

  port_range_min = tostring(each.value.from_port)
  port_range_max = tostring(each.value.to_port)

  remote_ip_prefix = each.value.cidr
  remote_group_id  = each.value.remote_group_id
  ethertype        = each.value.ethertype
  description      = each.value.description
}

resource "airtelcloud_security_group_rule" "egress" {
  for_each = {
    for idx, rule in var.egress_rules :
    idx => rule
  }

  security_group_id = airtelcloud_security_group.this.id

  direction = "egress"

  protocol = each.value.protocol

  port_range_min = tostring(each.value.from_port)
  port_range_max = tostring(each.value.to_port)

  remote_ip_prefix = each.value.cidr
  remote_group_id  = each.value.remote_group_id
  ethertype        = each.value.ethertype
  description      = each.value.description
}
