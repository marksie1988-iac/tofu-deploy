terraform {
  backend "local" {
    path = "/automation/tfstate/servers/lan/terraform.tfstate"
  }
}
