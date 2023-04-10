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

variable "ssh_authorized_key" {
  description = "The authorized ssh key for the vms"
  type        = string
}

variable "datastore_name" {
  description = "The datastore name for the virtual machines"
  type        = string
}

variable "ovf_file_path" {
  description = "The path to the OVF file for the virtual machine image"
  type        = string
}

# Kube master settings
variable "kube_master_name" {
  description = "The kube-master VM name"
  type        = string
}

variable "kube_master_username" {
  description = "The kube-master VM username"
  type        = string
}

variable "kube_master_memsize" {
  description = "The kube-master VM memory size (in MB)"
  type        = number
}

variable "kube_master_numvcpus" {
  description = "The number of vCPUs for the kube-master VM"
  type        = number
}

variable "kube_master_disk_size" {
  description = "The kube-master VM disk size (in GB)"
  type        = number
}

variable "kube_master_network_name" {
  description = "The network name for kube-master"
  type        = string
}

variable "kube_master_ip_address" {
  description = "The kube-master VM IP address"
  type        = string
}

variable "kube_master_cidr_prefix" {
  description = "The kube-master VM CIDR prefix"
  type        = number
}

variable "kube_master_gateway" {
  description = "The kube-master VM gateway IP address"
  type        = string
}

variable "kube_master_dns_server" {
  description = "The kube-master VM dns server"
  type        = string
}

variable "kube_master_ntp_server" {
  description = "The kube-master VM ntp server to syncronize the time to"
  type        = string
}

# Kube worker settings
variable "kube_worker_name" {
  description = "The kube-worker VM name"
  type        = string
}

variable "kube_worker_username" {
  description = "The kube-worker VM username"
  type        = string
}

variable "kube_worker_memsize" {
  description = "The kube-worker VM memory size (in MB)"
  type        = number
}

variable "kube_worker_numvcpus" {
  description = "The number of vCPUs for the kube-worker VM"
  type        = number
}

variable "kube_worker_disk_size" {
  description = "The kube-worker VM disk size (in GB)"
  type        = number
}

variable "kube_worker_network_name" {
  description = "The network name for kube-worker"
  type        = string
}

variable "kube_worker_ip_address" {
  description = "The kube-worker VM IP address"
  type        = string
}

variable "kube_worker_cidr_prefix" {
  description = "The kube-worker VM CIDR prefix"
  type        = number
}

variable "kube_worker_gateway" {
  description = "The kube-worker VM gateway IP address"
  type      = string
}

variable "kube_worker_dns_server" {
  description = "The kube-master VM dns server"
  type        = string
}

variable "kube_worker_ntp_server" {
  description = "The kube-worker VM ntp server to syncronize the time to"
  type        = string
}
