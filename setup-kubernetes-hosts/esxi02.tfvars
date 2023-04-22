# ESXi settings
esxi_hostname         = "10.10.99.22"
esxi_hostport         = 22
esxi_username         = "root"
esxi_hostssl          = 443
datastore_name        = "Fast datastore"
ovf_file_path         = "focal-server-cloudimg-amd64.ova"
ssh_authorized_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgLY5i6/xGA7Fcak03HLavSW7tOj4S9G1ZPXCHkv40aH/m7Lx2E+FAzBil05PUa4EC2a2p8pdW8+M70+CeheIIHGSte2eQfbFdzNWh0HOlHivJzjAgaGHNe53L6VCAFwYtR6TyufYatKdyqlA/HyfvcCn4G6mmHNtHbf1yFh68G/CdQiX1YGtVFPJI7sXV/jGAYYH3bUMmGvi9fEVbLXmVuYyihdr+6FTrehcZ0gYfNnh2cJABV6LbjSOBRDyeup5E+GiC8SFHspKjerMamlFHdhn/khp2npS6YWZaz1t0DbX/Zyr0Ltfm6VZ4V1wmpVwjwx1SZQwnWp8Zu1YUDJQnWk5XTzywlYHRu8SrK5FrnCiEm9AT80M/rD5ncFUvUZuhrKhG0yt5V94BT+9rPpplD//87ycM9OiaTe9EjjHTXjdIyR6jamwyoT28TfnlnXDoA4x0wtyHM00O/C9Qvg2sW6EQH8FqHcWrumri9UGrtMoFCLHYYc/8lJOmk8IdpgU= avd@BeastPC-Anthony"

# Kube master settings
kube_master_name      = "kubemaster02"
kube_master_username  = "avd"
kube_master_memsize   = 12288
kube_master_numvcpus  = 4
kube_master_disk_size = 30
kube_master_network_name = "Kube"

rook_disk_size = 40

# IP configuration for kube-master
kube_master_ip_address       = "10.10.40.12"
kube_master_cidr_prefix      = 24
kube_master_gateway          = "10.10.40.1"
kube_master_dns_server       = "10.10.40.1"
kube_master_ntp_server       = "10.10.40.1"

# Kube worker settings
kube_worker_name      = "kubeworker02"
kube_worker_username  = "avd"
kube_worker_memsize   = 8192
kube_worker_numvcpus  = 4
kube_worker_disk_size = 30
kube_worker_network_name = "Kube"

# IP configuration for kube-worker
kube_worker_ip_address       = "10.10.40.22"
kube_worker_cidr_prefix      = 24
kube_worker_gateway          = "10.10.40.1"
kube_worker_dns_server       = "10.10.40.1"
kube_worker_ntp_server       = "10.10.40.1"
