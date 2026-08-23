#!/bin/bash
set -euo pipefail
TARGET_URL="${1:-http://localhost:8080}"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$TARGET_URL/healthz" || echo "000")
[ "$STATUS" -eq 200 ] && exit 0 || exit 1
