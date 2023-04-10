# Setup Kubernetes hosts
Deploys a worker and master node on the specified ESXi host using Terraform.

## Getting started
For debugging purposes it can be handy to add a password for sign in through ESXi.  
Generate a password with `mkpasswd` in a linux/wsl. Add the following to your primary user in the `users` section in `userdata.tpl`. 
```yaml
lock_passwd: false
passwd: $y$j9T$aCEIzF9Bnbsrn8N7gzPqy1$GkCDRdB4i5bZnJaPSsCiXGtBzaot0.pKq93Q0Q8JrK/
```