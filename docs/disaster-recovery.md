# Disaster Recovery Strategy

- **Primary Region:** ap-south-1 (Mumbai)
- **DR Region:** ap-southeast-1 (Singapore)
- **Target RTO:** < 15 Minutes
- **Target RPO:** < 5 Minutes
- **Replication:** Cross-Region RDS automated snapshot copy and Route 53 DNS Failover routing policy.
