# ESXi settings
variable "esxi_hostname" {
  description = "The ESXi host IP address or domain name"
  type        = string
}

variable "esxi_hostport" {
  description = "The ESXi host SSH port"
  type        = number
}

variable "esxi_username" {
  description = "The ESXi host username"
  type        = string
}

variable "esxi_password" {
  description = "The ESXi host password"
  type        = string
  sensitive   = true
}

variable "esxi_hostssl" {
  description = "Secure port of the ESXi host"
  type        = number
}

variable "wan_uplink" {
  description = "Uplink interface for the WAN"
  type        = string
}

variable "lan_uplink" {
  description = "Uplink interface for the LAN"
  type        = string
}

variable "sync_uplink" {
  description = "Uplink interface for Sync"
  type        = string
}