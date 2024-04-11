#!/bin/bash

echo "Executing init.sh script..."

# Install psycopg2
pip install psycopg2-binary &&
echo "Psycopg2 installed successfully."

# Install dbt deps 
dbt deps &&
echo "DBT deps installed successfully."

# Run dbt commands
dbt build &&
echo "DBT project built successfully."

# Run Python script
python /usr/app/alert_script.py &&
echo "Alerts execution completed."

sleep infinity
