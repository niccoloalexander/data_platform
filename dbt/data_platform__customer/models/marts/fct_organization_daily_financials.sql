{{ 
    config(
        alias='fact_organization_daily_metrics'
        , materialization='incremental'
        , unique_key='record_id'
        , incremental_strategy='append'
        , on_schema_change='append_new_columns'
        , full_refresh=false
    ) 
}}

with organization_financials_snapshot as (
    select 
        organization_id 
        , accrued_revenue
        , realized_revenue
        , balance 
        , current_date as recorded_date 
        , current_timestamp as recorded_at
    from {{ ref('dim_organizations') }}
    where 
        true 
        and accrued_revenue is not null 
        {% if is_incremental() %}
        and current_date > ( select max(recorded_date) from {{ this }} )
        {% endif %}
)
, generate_unique_key as (
    select 
        {{ dbt_utils.generate_surrogate_key([ 'organization_id', 'recorded_at']) }} as record_id
        , organization_id
        , accrued_revenue
        , realized_revenue
        , balance
        , recorded_date 
        , recorded_at 
    from organization_financials_snapshot 
)

select *
from generate_unique_key