# Setup kubernetes

## Requirements
- Any Unix/Linux environment or WSL2
- 3 Kubernetes masters for high availability

## Current playground
This setup assumes a couple things about your network but feel free to adapt it to your needs
- `10.10.40.0/24` network
- Kubernetes masters at `10.10.40.11`, `10.10.40.12` and `10.10.40.13`
- Kube vip at `10.10.40.10`
- Kubernetes workers at `10.10.40.21`, `10.10.40.22` and `10.10.40.23`
- Masters and workers are equally spread to on 3 esxi nodes

## How to use it
- Replace the secrets made by Ansible vault
    - Create a password file in your user home folder `~/.vault_pass.txt`
    - Add the following line in `~/.bashrc`: `export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt`
    - Go nuts and create secrets for every variable that requires it `ansible-vault encrypt_string --stdin-name 'var_name'`
- When you configured your `Gitlab Agent` to monitor a repository with secrets, encrypt the secrets with `kubeseal`
    - Create a normal secret resource like so: ``
    - Use `kubeseal --controller-name=sealed-secrets --controller-namespace=kube-system <mysecret.yml >mysealedsecret.yml`
    - Delete `mysecret.yml` before checking it into your repository
- Add a route to reach exposed services (cidr: `172.16.16.1/24`)
- Add a wildcard dns to `172.16.16.254` to support nginx ingress