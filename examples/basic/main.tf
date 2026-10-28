# Provider example: group only. Attach rules with airtelcloud_security_group_rule
# or pass ingress_rules / egress_rules into this module.

module "security_group" {
  source = "../../"

  security_group_name = "tft-sg-http-servers"
  availability_zone   = "S1"
}
