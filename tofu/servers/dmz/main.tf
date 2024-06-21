module "mp-prx" {
  source = "../../_modules/ubuntu-vm"
  count  = 1

  name        = format("mp-prx%02d", count.index + 1)
  description = "Proxy Server"

  node = var.node_name

  ssh_public_key = var.ssh_public_key

  memory      = 6144
  cpu_sockets = 1
  cpu_cores   = 4
  disk_size   = 32

  ip_address  = cidrhost(var.dmz_cidr_block, count.index + 10)
  gateway     = var.dmz_gateway_ip
  vlan_id     = 50
  started     = true
  dns_servers = var.dmz_dns_ip

}
