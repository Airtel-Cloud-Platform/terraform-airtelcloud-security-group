module "security_group" {
  source = "../../"

  security_group_name = "basic-sg"

  availability_zone = "S1"
}
