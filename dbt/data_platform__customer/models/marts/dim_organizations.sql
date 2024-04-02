{{ 
    config(
        alias='dim_organizations'
    ) 
}}

select 
    organization_id
    , legal_entity_country_code
    , count_total_contracts_active
    , accrued_revenue
    , realized_revenue
    , accepted_payment_amount
    , balance 
    , first_payment_date
    , last_payment_date
from {{ ref('int_organizations_joined_invoices_enriched') }}