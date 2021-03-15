#!/bin/bash

export TENANT_ID=
export SUBSCRIPTION_ID
export KEYVAULT
export SECRET_NAME



az login --tenant $TENANT_ID
az account set -s $SUBSCRIPTION_ID
export SECRET=$(az keyvault secret show --vault-name $KEYVAULT_NAME --name $SECRET_NAME --query value)
