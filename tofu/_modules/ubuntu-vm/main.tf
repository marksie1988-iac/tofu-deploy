
resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name        = var.name
  description = try(var.description, "")
  tags        = try(var.tags, [])

  node_name = var.node

  clone {
    vm_id = 9000
  }

  agent {
    enabled = true
  }


  disk {
    datastore_id = "ssd-thin"
    interface    = "scsi0"
    size         = var.disk_size
  }

  memory {
    dedicated = var.memory
  }

  cpu{
    sockets = var.cpu_sockets
    cores = var.cpu_cores
  }


  initialization {
    ip_config {
      ipv4 {
        address = "${var.ip_address}/24"
        gateway = var.gateway
      }

    }
    dns {
      servers = var.dns_servers
    }

    user_account {
      keys     = [trimspace(var.ssh_public_key)]
      username = "ubuntu"
    }

    //user_data_file_id = proxmox_virtual_environment_file.cloud_config.id
  }

  network_device {
    bridge  = "vmbr0"
    vlan_id = try(var.vlan_id, null)
  }

  serial_device {}

  started = var.started
}
