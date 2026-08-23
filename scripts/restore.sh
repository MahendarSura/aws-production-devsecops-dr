#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <backup.tar.gz>"
  exit 1
fi

exec "${PROJECT_ROOT}/disaster-recovery/restore/restore.sh" "$1"
