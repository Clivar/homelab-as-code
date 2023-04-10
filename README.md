# homelab-as-code
An Infrastructure-as-Code project designed to seamlessly and quickly create and destroy highly available homelab environments, with a primary focus on Kubernetes. 

# Requirements
The key is to keep the requirements and initial setup as easy as possible.

- ESXi (Free or paid)
- Terraform
- Terraform docs (optional)
- ovftool in PATH (requirement of https://github.com/josenk/terraform-provider-esxi). Use `install-ovftool.sh` to install it in WSL or linux
- Kubespray