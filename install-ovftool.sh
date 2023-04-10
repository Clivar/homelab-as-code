#!/bin/bash

ZIP_URL="https://vdc-repo.vmware.com/vmwb-repository/dcr-public/f87355ff-f7a9-4532-b312-0be218a92eac/b2916af6-9f4f-4112-adac-49d1d6c81f63/VMware-ovftool-4.5.0-20459872-lin.x86_64.zip"

# Install required packages
sudo apt-get update
sudo apt-get install -y wget unzip

# Download the ZIP package to a temporary location
wget -O /tmp/ovftool.zip "$ZIP_URL"

# Create the installation directory
sudo mkdir -p /usr/local/share/ovftool

# Extract the ZIP package to the installation directory, removing the top-level directory
sudo unzip /tmp/ovftool.zip -d /usr/local/share

# Remove the downloaded ZIP file from the temporary location
rm /tmp/ovftool.zip

# Add the installation directory to the current user's PATH
echo 'export PATH=$PATH:/usr/local/share/ovftool' >> ~/.bashrc

# Load the updated PATH for the current session
source ~/.bashrc

# Print the updated PATH and confirm the installation
echo "OVF Tool has been installed to /usr/local/share/ovftool"
echo "Updated PATH: $PATH"