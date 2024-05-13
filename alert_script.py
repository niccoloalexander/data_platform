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

    # Check if an environment variable is defined
    if 'FACT_TABLE_FOR_ALERTS' in os.environ:
        fact_table = os.environ['FACT_TABLE_FOR_ALERTS']
    else:
        fact_table = 'customer.analytics.fact_organization_daily_metrics'

    # Connect to the PostgreSQL database
    conn = psycopg2.connect(**conn_params)
    cursor = conn.cursor()

    # Query for detecting significant balance changes
    query = """
        select organization_id, balance_change_rate, previous_balance, balance
        from {} organization_daily_metrics
        where recorded_date = current_date
    """

    # Execute the query
    cursor.execute(query.format(fact_table))

    # Fetch all rows
    rows = cursor.fetchall()

    # Check for significant balance changes
    for row in rows:
        organization_id, balance_change_rate, previous_balance, balance = row

        if balance_change_rate is not None:
            if abs(balance_change_rate) >= 0.5:
                send_alert(organization_id, balance_change_rate, previous_balance, balance)
            else: pass
        else:
            pass
        
    # Close cursor and connection
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()
