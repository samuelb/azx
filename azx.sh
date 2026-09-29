#!/bin/bash

if command -v whiptail > /dev/null; then
  cmd=whiptail
elif command -v dialog > /dev/null; then
  cmd=dialog
else
  echo "Please install whiptail or dialog. Aborting." >&2
  exit 1
fi

if ! command -v jq > /dev/null; then
  echo "Please install jq. Aborting." >&2
  exit 1
fi

# one line per subscription: id, name, tenant id
list=$(az account list --output json | jq -r '.[] | [.id, .name, .tenantId] | @tsv')
if [[ -z $list ]]; then
  echo "No Azure Subscriptions found. Run 'az login' first." >&2
  exit 1
fi

# menu tags are numbers, so subscriptions with the same name stay distinct
ids=()
names=()
menu=()
while IFS=$'\t' read -r id name tenant; do
  ids+=("$id")
  names+=("$name")
  menu+=("${#ids[@]}" "$name  $tenant")
done <<< "$list"

if choice=$($cmd --menu "Choose your Azure Subscription" 24 80 15 "${menu[@]}" 3>&1 1>&2 2>&3); then
  az account set --subscription "${ids[choice-1]}" && echo -e "Active Azure Subscription: \033[1m${names[choice-1]}\033[0m"
fi
