# Data Platform

A postgres database app modeling customer data with an alerting feature for an operations team.

## How to use:

### Requirements
- Docker or Python > DBT
- Accompanying CSV datasets

### Initialization
- Edit the compose file line containing '/home/niccolo/projects/' with the correct absolute path snippet depending on where you save this repository.
- In the project directory and with Docker installed, run the command "docker compose up".
- Wait for a minute while everything spins up.
- Open http://localhost:8080/#!/overview to see the DBT project documentation.
- Replace pass with send_alert(organization_id, balance_change_rate, previous_balance, balance) and run "python ./alert_script.py or restart the container to see the alerting feature in action (albeit spammy).

### Troubleshooting
For initialization issues, try:
- Installing DBT and Postgres, navigating to the dbt/data_platform directory, and running the commands:
  - dbt seed
  - dbt run
  - dbt test
  - dbt docs generate
  - dbt docs serve
- Open http://localhost:8080/#!/overview to see the DBT project documentation.

## Reference Materials
### Lineage graph

<img width="1219" alt="image" src="https://github.com/niccoloalexander/data_platform/assets/44615193/c8bf4a22-7aae-462e-8126-30481d1dcc76">

### Project tree

```bash
.
├── .dbt
│   └── profiles.yml
├── .gitignore
├── README.md
├── alert_script.py
├── compose.yaml
├── dbt
│   └── data_platform__customer
│       ├── README.md
│       ├── analyses
│       │   ├── analyze_customer_balance_change_alert.sql
│       │   └── messy_eda.sql
│       ├── dbt_project.yml
│       ├── docs
│       │   └── docs.md
│       ├── macros
│       │   ├── filter_new_rows.sql
│       │   └── get_custom_schema.sql
│       ├── models
│       │   ├── exposures.yml
│       │   ├── intermediate
│       │   │   ├── int_invoices_enriched.sql
│       │   │   └── int_organizations_joined_invoices_enriched.sql
│       │   ├── marts
│       │   │   ├── dim_invoices.sql
│       │   │   ├── dim_organizations.sql
│       │   │   └── fct_organization_daily_financials.sql
│       │   ├── schema.yml
│       │   └── staging
│       │       ├── stg_customer__invoices.sql
│       │       └── stg_customer__organizations.sql
│       ├── packages.yml
│       ├── seeds
│       │   ├── schema.yml
│       │   └── utilities
│       │       └── invoice_enrichment.csv
│       ├── snapshots
│       └── tests
├── init.sh
└── init.sql
```
