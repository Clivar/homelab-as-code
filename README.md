# homelab-as-code
An Infrastructure-as-Code project designed to seamlessly and quickly create and destroy highly available homelab environments, with a primary focus on Kubernetes. 

## Requirements
The key is to keep the requirements and initial setup as easy as possible.

- ESXi (Free or paid)
- Terraform
- Terraform docs (optional)
- ovftool in PATH (requirement of https://github.com/josenk/terraform-provider-esxi). Use `install-ovftool.sh` to install it in WSL or linux
- Kubespray

## Getting started
Make sure to clone the repository properly:  
`git clone --recurse-submodules`

## Tips and tricks
Too lazy to always input your ESXi password every run? Add `export TF_VAR_esxi_password="mypassword"` to your `~/.bashrc` file