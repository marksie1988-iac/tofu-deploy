terraform {
  backend "local" {
    path = "/automation/tfstate/servers/rke/terraform.tfstate"
  }
}
