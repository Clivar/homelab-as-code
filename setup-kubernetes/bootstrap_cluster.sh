#!/bin/bash
# Set working directory to the script's path
MY_PATH=$(dirname "$0")
cd $MY_PATH

# Define the inventory directory
INVENTORY_DIR="inventory/mycluster"

# Function to display help message
display_help() {
    echo "Usage: $0 [options]"
    echo
    echo "Bootstrap the Kubernetes cluster using Kubespray"
    echo
    echo "Options:"
    echo "  -u, --user <username>              The username for the remote host"
    echo "  -k, --private-key <private_key>    The path to the private key for the remote host"
    echo
}

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    display_help
    exit 1
fi

# Process command-line options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -u|--user)
            VAR_USER="$2"
            shift 2
            ;;
        -k|--private-key)
            VAR_PRIVATE_KEY_PATH="$2"
            shift 2
            ;;
        -h|--help)
            display_help
            exit 0
            ;;
        *)
            echo "Invalid option: $1" >&2
            display_help
            exit 1
            ;;
    esac
done

# Check if required options are provided
if [ -z "$VAR_USER" ] || [ -z "$VAR_PRIVATE_KEY_PATH" ]; then
    echo "Error: Both --user and --private-key options are required." >&2
    display_help
    exit 1
fi

# Define the inventory directory
INVENTORY_DIR="inventory/mycluster"

# Check if inventory directory exists
if [ ! -d "$INVENTORY_DIR" ]; then
    echo "Error: Inventory directory '$INVENTORY_DIR' does not exist." >&2
    exit 1
fi

# Bootstrap the Kubernetes cluster using Kubespray
ansible-playbook -i ${INVENTORY_DIR}/hosts.yaml --user $VAR_USER --private-key $VAR_PRIVATE_KEY_PATH --become --become-user=root --ssh-common-args='-o StrictHostKeyChecking=no' cluster.yml