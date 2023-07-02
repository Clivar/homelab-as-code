#cloud-config
hostname: ${hostname}
manage_etc_hosts: true
timezone: Europe/Brussels

users:
  - name: ${username}
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, sudo
    ssh_authorized_keys:
      - ${ssh_authorized_key}
    shell: /bin/bash

package_reboot_if_required: true
package_update: true
package_upgrade: true
packages:
  - apt-transport-https
  - ca-certificates
  - containerd
  - unattended-upgrades
  - ntp
  - logrotate
  - lvm2

write_files:
  - path: /etc/modules-load.d/containerd.conf
    content: |
      overlay
      br_netfilter

  - path: /etc/sysctl.d/99-kubernetes-cri.conf
    content: |
      net.bridge.bridge-nf-call-iptables  = 1
      net.ipv4.ip_forward                 = 1
      net.bridge.bridge-nf-call-ip6tables = 1

  - path: /etc/apt/apt.conf.d/50unattended-upgrades
    content: |
      Unattended-Upgrade::Allowed-Origins {
          "$${distro_id}:$${distro_codename}";
          "$${distro_id}:$${distro_codename}-security";
      };
      Unattended-Upgrade::Package-Blacklist {
      };
      Unattended-Upgrade::Automatic-Reboot "true";
      Unattended-Upgrade::Automatic-Reboot-Time "03:00";

  - path: /etc/apt/apt.conf.d/20auto-upgrades
    content: |
      APT::Periodic::Update-Package-Lists "1";
      APT::Periodic::Download-Upgradeable-Packages "1";
      APT::Periodic::AutocleanInterval "7";
      APT::Periodic::Unattended-Upgrade "7";
  - path: /etc/ntp.conf
    content: |
      server ${ntp_server}
      driftfile /var/lib/ntp/ntp.drift
      logfile /var/log/ntp.log

  - path: /etc/systemd/journald.conf
    content: |
      [Journal]
      SystemMaxUse=4G
      SystemKeepFree=5G
      MaxFileSec=7day
      MaxRetentionSec=7day
  - path: /etc/logrotate.d/kubernetes
    content: |
      /var/log/*.log {
          weekly
          missingok
          rotate 5
          compress
          notifempty
          create 0640 root root
      }

runcmd:
  - [modprobe, overlay]
  - [modprobe, br_netfilter]
  - [sh, -c, "sysctl --system"]
  - [sh, -c, "systemctl enable containerd"]
  - [sh, -c, "systemctl start containerd"]
  - [sh, -c, "systemctl restart ntp"]
  - [sh, -c, "systemctl restart systemd-journald"]
  - [sh, -c, "systemctl restart unattended-upgrades"]

swap:
  filename: ""
  size: 0
  maxsize: 0
