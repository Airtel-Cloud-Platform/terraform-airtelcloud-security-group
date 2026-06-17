module "security_group" {
  source = "../../"

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
    },
    {
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      cidr        = "0.0.0.0/0"
      description = "HTTPS Access"
    }
  ]

  egress_rules = [
    {
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      cidr        = "0.0.0.0/0"
      description = "HTTPS Outbound"
    }
  ]
}
