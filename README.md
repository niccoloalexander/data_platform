# Data Platform

A postgres database app modeling customer data with an alerting feature for an operations team. 

This is a DBT project used to showcase Analytics Engineering aptitude. The hypothetical use case is to monitor organization finances and alert on large balance changes. In this project, we are constrained to using raw dim data with updated (lacking historical) attributes only.

## How to use:

### Requirements
- Docker or Python > DBT
- Accompanying CSV datasets placed in the csv_data directory.

### Initialization
- Edit the compose file line containing '/home/niccolo/projects/' with the correct absolute path snippet depending on where you save this repository.
- In the project directory and with Docker installed, run the command "docker compose up".
- Wait for a minute while everything spins up.
- Open http://localhost:8080/#!/overview to see the DBT project documentation.
- Replace pass in alert_script.py with send_alert(organization_id, balance_change_rate, previous_balance, balance) and run "python ./alert_script.py or restart the container replacing >= 0.5 with <0.5 to see the alerting feature in action (albeit spammy).

### Troubleshooting
For initialization issues, try:
- Installing DBT and Postgres, navigating to the dbt/data_platform directory, and running the commands:
  - dbt seed
  - dbt run
  - dbt test
  - dbt docs generate
  - dbt docs serve
- Open http://localhost:8080/#!/overview to see the DBT project documentation.

## Project 

### Prompt

Given a dataset of unique invoices (without a date field) and a dataset of unique organizations, prepare a function that sends alerts when customer balances change by 50% or more. Follow DBT best practices while doing so.

### Solution
- Organization balances are computed from invoices.
- Daily balance snapshots are incrementally loaded into a fact table.
  - This table is configured not to full refresh due to a data loss risk given the constraint that only most recent attributes on invoices are available from raw data.
- An analysis is compiled onto an alert script which send an alert for any organization that has a balance change of more than 50% from the previous day.
  - The script works moving forward from project creation.

### Interesting Choices

**Seed instead of case when for invoice enrichment**
I like this option because I had to make assumptions on how to treat each field in computing for balance and other fields. This format makes it easy to make adjustments and is arguably easier than looking at conditional logic in SQL to understand what's going on. Some other thoughts:
- It would be a good idea to compare this strategy to using case whens in terms of computational cost.
- Downstream incrementals may have to be fully refreshed after changes to this seed.

**Postgres as the DB**
I wanted to learn how to utilize a free containerized database while doing this project. There are a few things I miss while on Postgres that I would've utilized if on Snowflake:
- UDTFs in a variety of languages. Writing these as macros, using Jinja for database and target schema, and generating them through pre or post-hooks.
- Snowpark for Slack Alerts.
- Useful statements and functions like qualify and median.

**More thoughts on Alerts**
- It would be less spammy to send a full list in the Alert rather than a single item at a time. But perhaps the operations team likes to have a dedicated thread per customer issue.

**Styling**
I enjoy leading commas because it's easy to query and adjust queries as I go along writing SQL. But it's important to have an agreed-upon styling policy so that a team can work well together. An improvement would've been to run everything through a compiler to strictly follow a styling guide.

## Reference Materials
### Lineage graph

![image](https://github.com/niccoloalexander/data_platform/assets/44615193/cb5bef22-0f99-457a-a0fa-82b76b0e6d7d)

### Project tree

```bash
.
├── README.md
├── alert_script.py
├── compose.yaml
├── csv_data
├── dbt
│   ├── data_platform__customer
│   │   ├── README.md
│   │   ├── analyses
│   │   │   ├── messy_eda.sql
│   │   │   └── organizations_with_large_balance_changes.sql
│   │   ├── dbt_project.yml
│   │   ├── docs
│   │   │   └── docs.md
│   │   ├── macros
│   │   │   ├── filter_new_rows.sql
│   │   │   └── get_custom_schema.sql
│   │   ├── models
│   │   │   ├── exposures.yml
│   │   │   ├── intermediate
│   │   │   │   ├── int_invoices_enriched.sql
│   │   │   │   └── int_organizations_joined_invoices_enriched.sql
│   │   │   ├── marts
│   │   │   │   ├── dim_invoices.sql
│   │   │   │   ├── dim_organizations.sql
│   │   │   │   └── fct_organization_daily_financials.sql
│   │   │   ├── schema.yml
│   │   │   ├── staging
│   │   │   │   ├── stg_customer__invoices.sql
│   │   │   │   └── stg_customer__organizations.sql
│   │   │   └── utilities
│   │   ├── packages.yml
│   │   ├── seeds
│   │   │   ├── schema.yml
│   │   │   └── utilities
│   │   │       └── invoice_enrichment.csv
│   │   ├── snapshots
│   │   │   └── invoices_snapshot.sql
│   │   └── tests
│   │       └── generic
│   │           └── values_present_in_other_model.sql
│   ├── dbt_packages
│   └── logs
│       └── dbt.log
├── init.sh
└── init.sql
```
### Task Management

This is screenshot of how I managed tasks on Notion while creating this sample project.

<img width="384" alt="image" src="https://github.com/niccoloalexander/data_platform/assets/44615193/9b5a6b9e-7d4e-48a5-b10e-c99036b6e38f">

