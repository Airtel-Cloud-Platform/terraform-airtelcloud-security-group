# Same fields as the provider SG + rule examples: ingress HTTP/SSH and egress HTTPS.
# The module still creates airtelcloud_security_group_rule as a separate resource type.

module "security_group" {
  source = "../../"

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
