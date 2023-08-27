# Setup ESXi
This sets up your VLANS and vSwitches

## Getting started
You can generate a tfvars file with `Terraform Docs`
```sh
terraform-docs tfvars hcl .
```
  
You can import existing switches/portgroups like this:
```sh
terraform import --var-file esxi01.tfvars esxi_vswitch.og_switch vSwitch0
terraform import --var-file esxi01.tfvars esxi_portgroup.iot IOT
```

If you have multiple hosts, use workspaces:
```sh
terraform workspace new esxi01
terraform workspace select esxi01
```