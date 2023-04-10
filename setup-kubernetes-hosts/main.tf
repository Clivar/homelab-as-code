terraform {
  required_providers {
    esxi = {
      source  = "josenk/esxi"
      version = "1.10.3"
    }
  }
}

provider "esxi" {
  esxi_hostname      = var.esxi_hostname
  esxi_hostport      = var.esxi_hostport
  esxi_username      = var.esxi_username
  esxi_password      = var.esxi_password
  esxi_hostssl       = var.esxi_hostssl
}

resource "esxi_guest" "kube_master" {
  guest_name   = var.kube_master_name
  disk_store   = var.datastore_name

  network_interfaces {
    virtual_network = var.kube_master_network_name
  }

  ovf_source = var.ovf_file_path
  power = "on"
  guest_startup_timeout = 60
  ovf_properties_timer   = 20

  # Customize the cloud-init user-data
  guestinfo = {
    "userdata" = base64encode(templatefile("userdata.tpl", {
        hostname          = var.kube_master_name
        username          = var.kube_master_username
        ssh_authorized_key = var.ssh_authorized_key
        ntp_server       = var.kube_master_ntp_server
    }))
    "userdata.encoding" = "base64"
    "metadata" = base64encode(templatefile("metadata.tpl", {
        hostname          = var.kube_master_name
        ip_address       = var.kube_master_ip_address
        cidr_prefix      = var.kube_master_cidr_prefix
        gateway          = var.kube_master_gateway
        dns_server       = var.kube_master_dns_server
    }))
    "metadata.encoding" = "base64"
  }

  # VM configuration
  memsize = var.kube_master_memsize
  numvcpus = var.kube_master_numvcpus

  # Disk configuration
  boot_disk_type = "thin"
  boot_disk_size = var.kube_master_disk_size
}

resource "esxi_guest" "kube_worker" {
  guest_name   = var.kube_worker_name
  disk_store   = var.datastore_name

  network_interfaces {
    virtual_network = var.kube_worker_network_name
  }

  ovf_source = var.ovf_file_path
  power = "on"
  guest_startup_timeout = 60
  ovf_properties_timer   = 20

  # Customize the cloud-init user-data
  guestinfo = {
    "userdata" = base64encode(templatefile("userdata.tpl", {
        hostname          = var.kube_worker_name
        username          = var.kube_worker_username
        ssh_authorized_key = var.ssh_authorized_key
        ip_address       = var.kube_worker_ip_address
        cidr_prefix      = var.kube_worker_cidr_prefix
        gateway          = var.kube_worker_gateway
        dns_server       = var.kube_worker_dns_server
        ntp_server       = var.kube_worker_ntp_server
    }))
    "userdata.encoding" = "base64"
    "metadata" = base64encode(templatefile("metadata.tpl", {
        hostname          = var.kube_worker_name
        ip_address       = var.kube_worker_ip_address
        cidr_prefix      = var.kube_worker_cidr_prefix
        gateway          = var.kube_worker_gateway
        dns_server       = var.kube_worker_dns_server
    }))
    "metadata.encoding" = "base64"
  }
  

  # VM configuration
  memsize = var.kube_worker_memsize
  numvcpus = var.kube_worker_numvcpus

  # Disk configuration
  boot_disk_type = "thin"
  boot_disk_size = var.kube_worker_disk_size
}

