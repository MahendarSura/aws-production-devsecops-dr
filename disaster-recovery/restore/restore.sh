#!/usr/bin/env bash
set -euo pipefail

BACKUP_FILE="${1:-}"

if [[ -z "${BACKUP_FILE}" ]]; then
  echo "Usage: $0 <backup.tar.gz>"
  exit 1
fi

if [[ ! -f "${BACKUP_FILE}" ]]; then
  echo "ERROR: Backup file not found: ${BACKUP_FILE}"
  exit 1
fi

if ! command -v kubectl >/dev/null 2>&1; then
  echo "ERROR: kubectl is not installed."
  exit 1
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

tar -xzf "${BACKUP_FILE}" -C "${TMP_DIR}"

BACKUP_DIR="$(find "${TMP_DIR}" -mindepth 1 -maxdepth 1 -type d | head -1)"

if [[ -z "${BACKUP_DIR}" ]]; then
  echo "ERROR: Invalid backup archive."
  exit 1
fi

echo "Restoring Kubernetes resources..."

kubectl apply -f "${BACKUP_DIR}/production-namespace.yaml" 2>/dev/null || true
kubectl apply -f "${BACKUP_DIR}/production-resources.yaml" 2>/dev/null || true
kubectl apply -f "${BACKUP_DIR}/configmaps.yaml" 2>/dev/null || true
kubectl apply -f "${BACKUP_DIR}/secrets.yaml" 2>/dev/null || true

echo "Restore completed."
