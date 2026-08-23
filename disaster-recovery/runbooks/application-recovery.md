# Application Recovery Runbook
- Scale pods: `kubectl scale deployment/production-app --replicas=5 -n production`
- Verify rollout: `kubectl rollout status deployment/production-app -n production`
