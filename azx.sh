#!/bin/bash

if command -v whiptail > /dev/null; then
  cmd=whiptail
elif command -v dialog > /dev/null; then
  cmd=dialog
else
  echo "Please install whiptale or dialog. Aborting."
  exit 1
fi

IFS=$'\n' subscriptions=($(az account list --output json | jq -r '.[] | .name, .tenantId'))
choice=$($cmd --menu "Choose your Azure Subscription" 24 80 15 "${subscriptions[@]}" 3>&1 1>&2 2>&3)

if [[ $? == 0 ]]; then
    az account set --subscription $choice && echo -e "Active Azure Subscription: \033[1m${choice}\033[0m"
fi
