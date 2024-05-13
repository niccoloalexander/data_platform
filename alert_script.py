import os 
import psycopg2

def send_alert(organization_id, balance_change_rate, balance, previous_balance):
    print(f"Organization {organization_id} has experienced a ({balance_change_rate}%) change in balance from {previous_balance} to {balance}.")

def main():
    # Define your PostgreSQL connection parameters
    conn_params = {
        "host": "db",
        "database": "customer",
        "user": "postgres",
        "password": "postgres",
    }

    # Connect to the PostgreSQL database
    conn = psycopg2.connect(**conn_params)
    cursor = conn.cursor()

    # Attempt to read the compiled SQL file
    try:
        with open("dbt/data_platform__customer/target/compiled/data_platform__customer/analyses/organizations_with_large_balance_changes.sql", "r") as sql_file:
            query = sql_file.read()

    # If the file is absent, use the manually pasted query
    except FileNotFoundError:
        query = """
        with get_current_balances_and_previous_balances as (
            select 
                organization_id 
                , balance 
                , lag(balance) over (partition by organization_id order by recorded_at) as previous_balance 
            from "customer"."analytics"."fact_organization_daily_metrics"
            where recorded_date >= current_date - 1
        )
        , get_balance_change_rates as (
            select 
                organization_id
                , balance 
                , previous_balance
                , (balance - previous_balance) / previous_balance as balance_change_rate
            from get_current_balances_and_previous_balances
        )
        , keep_organizations_with_large_balance_change_rates as (
            select * 
            from get_balance_change_rates
            where abs(balance_change_rate) >= 0.5
            order by balance_change_rate desc 
        )

        select * 
        from keep_organizations_with_large_balance_change_rates
        """

    # Execute the query
    cursor.execute(query)

    # Fetch all rows
    rows = cursor.fetchall()

    # Check for significant balance changes
    for row in rows:
        send_alert(organization_id, balance_change_rate, previous_balance, balance)

    # Close cursor and connection
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()
