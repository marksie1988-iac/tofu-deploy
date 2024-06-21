terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.60.0"
    }
  }
}

provider "proxmox" {
  # Configuration options
  insecure = false
  ssh {
    username = "terraform"
  }
}
