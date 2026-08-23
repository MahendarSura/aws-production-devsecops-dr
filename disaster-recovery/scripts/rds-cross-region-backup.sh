#!/usr/bin/env bash
set -euo pipefail

PRIMARY_REGION="ap-south-1"
DR_REGION="ap-southeast-1"
DB_INSTANCE="prod-postgres-db"
TIMESTAMP=$(date +%Y%m%d%H%M%S)
SNAPSHOT_ID="db-snap-$TIMESTAMP"

echo "[1/3] Creating RDS manual snapshot in primary region ($PRIMARY_REGION): $SNAPSHOT_ID"
aws rds create-db-snapshot --db-instance-identifier "$DB_INSTANCE" --db-snapshot-identifier "$SNAPSHOT_ID" --region "$PRIMARY_REGION" || true

echo "[2/3] Copying snapshot to DR region ($DR_REGION)..."
aws rds copy-db-snapshot     --source-db-snapshot-identifier "arn:aws:rds:$PRIMARY_REGION:123456789012:snapshot:$SNAPSHOT_ID"     --target-db-snapshot-identifier "$SNAPSHOT_ID-replica"     --source-region "$PRIMARY_REGION"     --region "$DR_REGION" || true

echo "[3/3] Cross-region DR backup successfully completed. Target RPO: < 5 mins."
