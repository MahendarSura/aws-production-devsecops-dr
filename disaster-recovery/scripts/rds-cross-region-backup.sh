#!/bin/bash
set -euo pipefail
PRIMARY_REGION="${AWS_PRIMARY_REGION:-ap-south-1}"
DR_REGION="${AWS_DR_REGION:-ap-southeast-1}"
DB_INSTANCE_ID="${DB_INSTANCE_ID:-devsecops-dr-dev-postgres}"
SNAPSHOT_ID="${DB_INSTANCE_ID}-snapshot-$(date +%Y%m%d%H%M%S)"

aws rds create-db-snapshot --db-instance-identifier "$DB_INSTANCE_ID" --db-snapshot-identifier "$SNAPSHOT_ID" --region "$PRIMARY_REGION"
aws rds wait db-snapshot-completed --db-snapshot-identifier "$SNAPSHOT_ID" --region "$PRIMARY_REGION"
aws rds copy-db-snapshot --source-db-snapshot-identifier "arn:aws:rds:${PRIMARY_REGION}:*:snapshot:${SNAPSHOT_ID}" --target-db-snapshot-identifier "${SNAPSHOT_ID}-dr" --source-region "$PRIMARY_REGION" --region "$DR_REGION"
