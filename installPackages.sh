#!/bin/bash

apt-get update
apt-get install curl -y
apt-get install gnupg -y
# apt-get install software-properties-common


# INSTALL HC VAULT
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
#setcap cap_ipc_lock= /usr/bin/vault
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && apt-get install vault

# INSTALL AZURE CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | bash
