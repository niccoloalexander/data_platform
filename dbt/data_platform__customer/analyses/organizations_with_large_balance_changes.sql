with get_current_balances_and_previous_balances as (
    select 
        organization_id 
        , balance 
        , lag(balance) over (partition by organization_id order by recorded_at) as previous_balance 
    from {{ ref('fct_organization_daily_financials') }}
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