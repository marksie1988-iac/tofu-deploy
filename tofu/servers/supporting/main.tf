module "mp-bast" {
  source = "../../_modules/ubuntu-vm"
  count  = 1

  name        = format("mp-bast%02d", count.index + 1)
  description = "Bastion Server"

  node = var.node_name

  ssh_public_key = var.ssh_public_key

  memory      = 2048
  cpu_sockets = 1
  cpu_cores   = 2
  disk_size   = 32

  ip_address  = cidrhost(var.cidr_block, count.index + 43)
  gateway     = var.gateway_ip
  vlan_id     = 20
  started     = true
  dns_servers = var.dns_ip

}
module "mp-ansi" {
  source = "../../_modules/ubuntu-vm"
  count  = 1

  name        = format("mp-ansi%02d", count.index + 1)
  description = "Ansible Server"

  node = var.node_name

  ssh_public_key = var.ssh_public_key

  memory      = 2048
  cpu_sockets = 1
  cpu_cores   = 2
  disk_size   = 32

  ip_address  = cidrhost(var.cidr_block, count.index + 10)
  gateway     = var.gateway_ip
  vlan_id     = 20
  started     = true
  dns_servers = var.dns_ip

}

module "mp-dev" {
  source = "../../_modules/ubuntu-vm"
  count  = 1

  name        = format("mp-dev%02d", count.index + 1)
  description = "Dev Container Server"

  node = var.node_name

  ssh_public_key = var.ssh_public_key

  memory      = 24576
  cpu_sockets = 1
  cpu_cores   = 4
  disk_size   = 32

  ip_address  = cidrhost(var.cidr_block, count.index + 7)
  gateway     = var.gateway_ip
  vlan_id     = 20
  started     = true
  dns_servers = var.dns_ip

}
