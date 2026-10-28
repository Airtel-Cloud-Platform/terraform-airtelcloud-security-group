# Airtel Cloud Security Group Terraform Module

Creates an `airtelcloud_security_group` and optional `airtelcloud_security_group_rule` resources (separate provider type). Rules are not nested attributes on the group.

## Usage

### Basic (group only)

Matches the provider group resource without rules.

```hcl
module "security_group" {
  source = "Airtel-Cloud-Platform/security-group/airtelcloud"

  security_group_name = "tft-sg-http-servers"
  availability_zone   = "S1"
}
```

Equivalent provider form:

```hcl
resource "airtelcloud_security_group" "web" {
  security_group_name = "tft-sg-http-servers"
  availability_zone   = "S1"
}

resource "airtelcloud_security_group_rule" "http" {
  security_group_id = airtelcloud_security_group.web.id
  direction         = "ingress"
  protocol          = "tcp"
  port_range_min    = "80"
  port_range_max    = "80"
  remote_ip_prefix  = "0.0.0.0/0"
  ethertype         = "IPv4"
}
```

### Ingress and egress rules

The module maps each list item to `airtelcloud_security_group_rule` (`direction` ingress or egress). `from_port`/`to_port` → `port_range_min`/`port_range_max`; `cidr` → `remote_ip_prefix`.

```hcl
module "security_group" {
  source = "Airtel-Cloud-Platform/security-group/airtelcloud"

  security_group_name = "tft-sg-web-servers"
  availability_zone   = "S1"

  ingress_rules = [
    {
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80
      cidr        = "0.0.0.0/0"
      description = "Allow HTTP"
    },
    {
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr        = "10.0.0.0/8"
      description = "Allow SSH from internal network"
    }
  ]

  egress_rules = [
    {
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      cidr        = "0.0.0.0/0"
      description = "Allow HTTPS outbound"
    }
  ]
}
```

## Inputs

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| security_group_name | Group name | string | Yes |
| availability_zone | AZ | string | No |
| ingress_rules | Ingress `airtelcloud_security_group_rule` items | list(object) | No |
| egress_rules | Egress `airtelcloud_security_group_rule` items | list(object) | No |

Rule object: `protocol`, `from_port`, `to_port`, optional `cidr`, `remote_group_id`, `ethertype` (default `IPv4`), `description`.

## Outputs

| Name | Description |
| --- | --- |
| security_group_id | Numeric ID |
| security_group_uuid | UUID |
| security_group_status | Status |
| az_name | Computed AZ name |
| az_region | Computed AZ region |
| created_at | Created timestamp |
| updated_at | Updated timestamp |
| ingress_rule_ids | Ingress rule IDs |
| egress_rule_ids | Egress rule IDs |
| security_group | Object of the computed group attributes above |

## Notes

Pass the numeric ID to a VM, not the UUID:

```hcl
security_group_id = tostring(module.security_group.security_group_id)
```

## Requirements

| Name | Version |
| --- | --- |
| Terraform | >= 1.5 |
| airtelcloud provider | >= 1.0.4 |
