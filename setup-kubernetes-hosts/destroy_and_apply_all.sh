#!/bin/bash

# Function to handle Control+C signal
function cleanup() {
    echo "Script interrupted by user, exiting"
    exit 1
}

# Set trap for Control+C signal
trap cleanup INT

workspaces=("esxi01" "esxi02" "esxi03")

for workspace in "${workspaces[@]}"
do
    echo "Switching to workspace $workspace"
    
    # Check if workspace exists, create it if it doesn't
    if ! terraform workspace select $workspace &>/dev/null; then
        echo "Workspace $workspace not found, creating it"
        terraform workspace new $workspace
        terraform init
    fi
    
    echo "Destroying resources for workspace $workspace"
    terraform destroy -auto-approve --var-file "$workspace.tfvars"
done

for workspace in "${workspaces[@]}"
do
    echo "Switching to workspace $workspace"
    terraform workspace select $workspace
    
    # Apply changes with retries
    # The esxi provider sometimes crashes while creating a disk
    tries=0
    max_retries=5
    while [ $tries -lt $max_retries ]; do
        echo "Applying changes for workspace $workspace (try $((tries+1))/$max_retries)"
        if terraform apply -auto-approve --var-file "$workspace.tfvars"; then
            break
        fi
        tries=$((tries+1))
        sleep 5
    done

    # Exit with error message if apply fails after maximum retries
    if [ $tries -eq $max_retries ]; then
        echo "Error: Failed to apply changes after $max_retries retries for workspace $workspace"
        exit 1
    fi
done

echo "done"