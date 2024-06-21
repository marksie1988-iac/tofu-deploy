variable "ssh_public_key" {
  description = "Public key file location"
  type        = string
}

variable "name" {
  description = "Name of the VM"
  type        = string
}

variable "description" {
  description = "Description of the vm (Optional)"
  default     = ""
  type        = string
}

variable "tags" {
  description = "Tags to be added to the vm (Optional)"
  default     = []
  type        = list(string)
}

variable "node" {
  description = "Proxmox node to deploy on"
}

variable "disk_size" {
  description = "Size of the primary disk"
}

variable "ip_address" {
  description = "IP Address for the VM"

}

variable "gateway" {
  description = "Default gateway"
}

variable "vlan_id" {
  description = "VLAN to connect default null"
}

variable "started" {
  description = "Should the VM be started?"
  default     = false
}
variable "dns_servers" {
  description = "DNS Servers"
  type        = list(string)
}


variable "memory" {
  description = "Amount of memory"
  type        = number
  default     = 2048
}

variable "cpu_sockets" {
  description = "number of cpu sockets"
  type        = number
  default     = 1
}

variable "cpu_cores" {
  description = "number of cpu cores"
  type        = number
  default     = 2
}
