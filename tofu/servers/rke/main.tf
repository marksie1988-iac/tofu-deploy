module "rke-srv" {
  source = "../../_modules/ubuntu-vm"
  count  = 3

  name        = format("rke-srv%02d", count.index + 1)
  description = "RKE Server"

  node = var.node_name

  ssh_public_key = var.ssh_public_key

  memory      = 2048
  cpu_sockets = 1
  cpu_cores   = 2
  disk_size   = 32

  ip_address  = cidrhost(var.cidr_block, count.index + 51)
  gateway     = var.gateway_ip
  vlan_id     = 20
  started     = true
  dns_servers = var.dns_ip

}

module "rke-agnt" {
  source = "../../_modules/ubuntu-vm"
  count  = 2

  name        = format("rke-agnt%02d", count.index + 1)
  description = "RKE Agent"

  node = var.node_name

  ssh_public_key = var.ssh_public_key

  memory      = 24576
  cpu_sockets = 1
  cpu_cores   = 4
  disk_size   = 32

  ip_address  = cidrhost(var.cidr_block, count.index + 54)
  gateway     = var.gateway_ip
  vlan_id     = 20
  started     = true
  dns_servers = var.dns_ip

}
