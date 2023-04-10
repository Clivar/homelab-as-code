# Setup Kubernetes hosts
Deploys a worker and master node on the specified ESXi host using Terraform and cloudinit.

## Getting started
Download an ubuntu OVA image at `https://cloud-images.ubuntu.com/`

## Debugging
It can be handy to add a password for sign in through ESXi. 
Generate a password with `mkpasswd` in a linux/wsl. Add the following to your primary user in the `users` section in `userdata.tpl`. 
```yaml
lock_passwd: false
passwd: $y$j9T$aCEIzF9Bnbsrn8N7gzPqy1$GkCDRdB4i5bZnJaPSsCiXGtBzaot0.pKq93Q0Q8JrK/
```
  
To check if the cloudinit was correctly applied, consult `/var/logs/cloudinit*`