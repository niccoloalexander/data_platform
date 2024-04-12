{{ 
    config(
        alias='fact_organization_daily_metrics'
        , materialization='incremental'
        , unique_key='record_id'
        , on_schema_change='ignore'
    ) 
}}

with organization_snapshot as (
    select 
        organization_id 
        , accrued_revenue
        , realized_revenue
        , balance 
        , current_date as recorded_date 
        , current_timestamp as recorded_at
    from {{ ref('dim_organizations') }}
    where accrued_revenue is not null 
)
, generate_unique_key as (
    select 
        {{ dbt_utils.generate_surrogate_key([ 'organization_id', 'recorded_date']) }} as record_id
        , organization_id
        , accrued_revenue
        , realized_revenue
        , balance
        , recorded_date 
        , recorded_at 
    from organization_snapshot 
)
, union_past_records_if_they_exist as (
    select 
        record_id 
        , organization_id 
        , accrued_revenue
        , realized_revenue
        , balance
        , recorded_date
        , recorded_at
    from generate_unique_key

    {% if is_incremental() %}

    union all 

    select 
        record_id 
        , organization_id 
        , accrued_revenue
        , realized_revenue
        , balance
        , recorded_date
        , recorded_at
    from {{ this }}
    where recorded_date <> current_date()
    {% endif %}
)
, get_previous_balance as (
    select 
        record_id 
        , organization_id 
        , accrued_revenue
        , realized_revenue
        , balance
        , lag(balance, 1) over (partition by organization_id order by recorded_at) as previous_balance
        , recorded_date
        , recorded_at
    from union_past_records_if_they_exist
)
, get_balance_change_rate as (
    select 
        record_id 
        , organization_id
        , accrued_revenue
        , realized_revenue
        , balance
        , previous_balance 
        , (balance - previous_balance) / previous_balance as balance_change_rate
        , recorded_date 
        , recorded_at 
    from get_previous_balance
    where recoreded_date = current_date()
)

select 
    record_id 
    , organization_id
    , accrued_revenue
    , realized_revenue
    , balance
    , previous_balance 
    , balance_change_rate
    , recorded_date 
    , recorded_at 
from get_balance_change_rate