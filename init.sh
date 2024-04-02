#!/bin/bash

sleep 10

echo "Executing init.sh script..."

# Install psycopg2
pip install psycopg2-binary

echo "Psycopg2 installed successfully."

sleep 10

# Run dbt commands
dbt seed
sleep 5
dbt run
sleep 60
dbt docs generate
sleep 10
dbt docs serve &

echo "dbt commands executed successfully."

sleep 10

# Run Python script
python /usr/app/alert_script.py

echo "Alerts execution completed."

sleep 3600
