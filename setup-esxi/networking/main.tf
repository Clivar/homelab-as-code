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

resource "esxi_vswitch" "og_switch" {
    name    =   "vSwitch0"
    promiscuous_mode = true
    mac_changes = true
    forged_transmits = true
    uplink {
        name = var.lan_uplink
    }
}

# resource "esxi_vswitch" "wan" {
#     name    =   "vSwitchWAN"
#     promiscuous_mode = true
#     mac_changes = true
#     forged_transmits = true
#     uplink {
#         name = var.wan_uplink
#     }
# }

# resource "esxi_vswitch" "sync" {
#     name    =   "vSwitchSync"
#     promiscuous_mode = true
#     mac_changes = true
#     forged_transmits = true
#     uplink {
#         name = var.sync_uplink
#     }
# }

resource "esxi_portgroup" "iot" {
    name = "IOT"
    vswitch = esxi_vswitch.og_switch.name
    vlan = 21
}

resource "esxi_portgroup" "wifi" {
    name = "WiFi"
    vswitch = esxi_vswitch.og_switch.name
    vlan = 20
}

resource "esxi_portgroup" "lan" {
    name = "LAN"
    vswitch = esxi_vswitch.og_switch.name
    vlan = 4095
}

resource "esxi_portgroup" "kube" {
    name = "Kube"
    vswitch = esxi_vswitch.og_switch.name
    vlan = 40
}

resource "esxi_portgroup" "virtual" {
    name = "Virtual"
    vswitch = esxi_vswitch.og_switch.name
    vlan = 30
}

# resource "esxi_portgroup" "sync" {
#     name = "Sync"
#     vswitch = esxi_vswitch.sync.name
#     vlan = 3
# }

# resource "esxi_portgroup" "wan" {
#     name = "WAN"
#     vswitch = esxi_vswitch.wan.name
#     vlan = 0
# }