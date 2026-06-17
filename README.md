# Airtel Cloud Security Group Terraform Module

Terraform module for provisioning Airtel Cloud Security Groups and Security Group Rules.

## Features

* Creates Security Groups
* Creates multiple ingress rules
* Outputs Security Group ID and UUID
* Compatible with Airtel Cloud Terraform Provider

## Usage

### Basic Example

```hcl
module "security_group" {
  source = "Airtel-Cloud-Platform/security-group/airtelcloud"

  security_group_name = "web-sg"

  availability_zone = "S1"
}
```

### Complete Example

```hcl
module "security_group" {
  source = "Airtel-Cloud-Platform/security-group/airtelcloud"

  security_group_name = "web-sg"

  availability_zone = "S1"

  ingress_rules = [
    {
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr        = "0.0.0.0/0"
      description = "SSH Access"
    },
    {
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80
      cidr        = "0.0.0.0/0"
      description = "HTTP Access"
    }
  ]
}
```

## Inputs

| Name                | Description           | Type         | Required |
| ------------------- | --------------------- | ------------ | -------- |
| security_group_name | Security group name   | string       | Yes      |
| availability_zone   | Availability zone     | string       | Yes      |
| ingress_rules       | List of ingress rules | list(object) | No       |

## Outputs

| Name                  | Description                    |
| --------------------- | ------------------------------ |
| security_group_id     | Numeric Security Group ID      |
| security_group_uuid   | Security Group UUID            |
| security_group_status | Security Group status          |
| security_group        | Complete security group object |

## Notes

The VM module expects the numeric Security Group ID when attaching a Security Group:

```hcl
security_group_id = tostring(module.security_group.security_group_id)
```

Do not use:

```hcl
security_group_id = module.security_group.security_group_uuid
```

when attaching a Security Group to a VM.

