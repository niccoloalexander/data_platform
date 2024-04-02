# Data Platform

A postgres database app modeling customer data with an alerting feature for an operations team.

## How to use:

### Initialization
- Edit the compose file line containing '/home/niccolo/projects/' with the correct absolute path snippet depending on where you save this repository.
- In the project directory and with Docker installed, run the command "docker compose up".
- Wait for a minute while everything spins up.
- Open http://localhost:8080/#!/overview to see the DBT project documentation.
- Replace pass with send_alert(organization_id, balance_change_rate, previous_balance, balance) and run "python ./alert_script.py or restart the container to see the alerting feature in action (albeit spammy).

### Troubleshooting
For initialization issues, try:
- Installing DBT, navigating to the dbt/data_platform directory, and running the commands:
  - dbt seed
  - dbt run
  - dbt test
  - dbt docs generate
  - dbt docs serve
- Open http://localhost:8080/#!/overview to see the DBT project documentation.

## Materials
### Lineage graph
