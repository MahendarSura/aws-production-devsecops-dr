#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="${BACKUP_DIR:-./backups}"
TIMESTAMP="$(date -u +%Y%m%dT%H%M%SZ)"
BACKUP_PATH="${BACKUP_DIR}/${TIMESTAMP}"

mkdir -p "${BACKUP_PATH}"

echo "Creating Kubernetes backup in ${BACKUP_PATH}"

if ! command -v kubectl >/dev/null 2>&1; then
  echo "ERROR: kubectl is not installed."
  exit 1
fi

kubectl get namespace production -o yaml > "${BACKUP_PATH}/production-namespace.yaml" 2>/dev/null || true
kubectl get all -n production -o yaml > "${BACKUP_PATH}/production-resources.yaml" 2>/dev/null || true
kubectl get configmaps -n production -o yaml > "${BACKUP_PATH}/configmaps.yaml" 2>/dev/null || true
kubectl get secrets -n production -o yaml > "${BACKUP_PATH}/secrets.yaml" 2>/dev/null || true

tar -czf "${BACKUP_PATH}.tar.gz" -C "${BACKUP_DIR}" "${TIMESTAMP}"
rm -rf "${BACKUP_PATH}"

echo "Backup created: ${BACKUP_PATH}.tar.gz"
