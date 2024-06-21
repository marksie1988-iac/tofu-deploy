module "mp-plex" {
  source = "../../_modules/ubuntu-vm"
  count  = 1

  name        = format("mp-plex%02d", count.index + 1)
  description = "Plex Server"

  node = var.node_name

  ssh_public_key = var.ssh_public_key

  memory      = 24576
  cpu_sockets = 2
  cpu_cores   = 3
  disk_size   = 32

  ip_address  = cidrhost(var.lan_cidr_block, count.index + 100)
  gateway     = var.lan_gateway_ip
  vlan_id     = 0
  started     = true
  dns_servers = var.lan_dns_ip

}
