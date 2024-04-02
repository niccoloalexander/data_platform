{{ 
    config(
        alias='stg_organizations'
    ) 
}}

with source_data as (
    select
        trim(organization_id::varchar) as organization_id 
        , trim(legal_entity_country_code::varchar) as legal_entity_country_code 
        , count_total_contracts_active::int as count_total_contracts_active 
        , first_payment_date::date as first_payment_date 
        , last_payment_date::date as last_payment_date 
        , created_date::date as created_date 
    from {{ source('postgres', 'raw_organizations') }}
)

select *
from source_data