instance-id: ${hostname}
local-hostname: ${hostname}
network:
  version: 2
  ethernets:
    ens32:
      dhcp4: no
      addresses:
        - ${ip_address}/${cidr_prefix}
      gateway4: ${gateway}
      nameservers:
        addresses:
          - ${dns_server}
