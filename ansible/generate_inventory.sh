#!/usr/bin/env bash
set -euo pipefail

inventory_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
terraform_dir="$inventory_dir/../terraform"
private_key="${1:?Usage: ./generate_inventory.sh /absolute/path/to/todo-ec2-key.pem}"
hosts=$(terraform -chdir="$terraform_dir" output -json ansible_hosts)

jq --arg key "$private_key" --argjson hosts "$hosts" '
  {
    all: {
      children: {
        dev: {
          hosts: {
            "todo-dev": ($hosts.dev + {
              ansible_ssh_private_key_file: $key,
              ansible_ssh_common_args: "-o IdentitiesOnly=yes"
            })
          }
        },
        prod: {
          hosts: {
            "todo-prod": ($hosts.prod + {
              ansible_ssh_private_key_file: $key,
              ansible_ssh_common_args: "-o IdentitiesOnly=yes"
            })
          }
        }
      }
    }
  }
' <<<"$hosts" > "$inventory_dir/inventory.yml"
