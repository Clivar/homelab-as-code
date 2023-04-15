# Setup Kubernetes
## Prerequisite
- This repo uses submodules to load `kubespray`. Make sure to clone it properly but if you didnt:
```sh
git submodule init
git submodule update
```
- Install the dependencies
    - Python
    - Run `./install-dependencies.sh`

## Upgrade kubespray
To upgrade Kubespray to a new release, follow these steps:
  
Update the .gitmodules file to point to the new release folder.
Refresh the submodule by running the following commands:
  
```sh
git submodule init
git submodule update
```
Before proceeding, create a backup of your current inventory configuration to ensure you don't lose any customizations:
  
```sh
cp -r inventory/mycluster inventory/mycluster_backup
```

Remove the old inventory folder:
```sh
rm -rf inventory/mycluster
```

Copy the updated sample inventory from the new Kubespray release:

```sh
cp -r kubespray/inventory/sample inventory/mycluster
```
Review and modify the new inventory/mycluster configuration according to your needs, using your backup (inventory/mycluster_backup) as a reference. Ensure all necessary customizations are applied to the new inventory.