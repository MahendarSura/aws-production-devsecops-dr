# Incident Response Runbook

1. **Alert Triggered:** Prometheus Alertmanager notifies on-call via PagerDuty/Slack.
2. **Triage:** Check Ingress HTTP 5xx error rate and Pod crash status.
3. **Mitigation:** Trigger automated rollback via  or failover script.
