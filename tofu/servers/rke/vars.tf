variable "virtual_environment_endpoint" {
  type = string
}
variable "node_name" {
  type = string
}
variable "ssh_public_key" {
  description = "Public key file location, for VM authentication"
  type        = string
}
variable "cidr_block" {
  type        = string
  description = "The IP Address block to use"
}
variable "gateway_ip" {
  type        = string
  description = "The gateway IP Address to use"
}
variable "dns_ip" {
  type        = list(string)
  description = "The DNS IP Address to use"
}
