## Setup kubernetes

## Current playground
This setup assumes a couple things about your network but feel free to adapt it to your needs
- `10.10.40.0/24` network
- Kubernetes masters at `10.10.40.11`, `10.10.40.12` and `10.10.40.13`
- Kube vip at `10.10.40.10`
- Kubernetes workers at `10.10.40.21`, `10.10.40.22` and `10.10.40.23`
- Masters and workers are equally spread to on 3 esxi nodes