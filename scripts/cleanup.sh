#!/bin/bash
set -euo pipefail
read -p "Run terraform destroy? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    terraform -chdir=terraform destroy -auto-approve
fi
