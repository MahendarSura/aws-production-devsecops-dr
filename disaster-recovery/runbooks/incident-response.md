# Incident Response Runbook
1. **Detection:** CloudWatch Synthetic Canary alerts on HTTP 5xx rate > 1%.
2. **Escalation:** On-Call engineer notified via PagerDuty.
3. **Failover Execution:** Run `./disaster-recovery/scripts/failover.sh`.
4. **Post-Recovery:** Verify health endpoints and DNS propagation.
