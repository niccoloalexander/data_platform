with organizations as (
    select 
        organization_id
        , legal_entity_country_code
        , count_total_contracts_active
        , first_payment_date
        , last_payment_date
    from {{ ref('stg_customer__organizations') }}
)
, aggregate_invoices_to_organizations_grain as (
    select 
        organization_id 
        , sum(accrued_revenue) as accrued_revenue
        , sum(realized_revenue) as realized_revenue
        , sum(accepted_payment_amount) as accepted_payment_amount
        , sum(balance) as balance 
    from {{ ref('int_invoices_enriched' )}}
    group by organization_id 
)
, organizations_joined_aggregate_invoices_to_organizations_grain as (
    select 
        coalesce(organizations.organization_id, aggregate_invoices_to_organizations_grain.organization_id) as organization_id
        , organizations.legal_entity_country_code
        , organizations.count_total_contracts_active
        , aggregate_invoices_to_organizations_grain.accrued_revenue
        , aggregate_invoices_to_organizations_grain.realized_revenue
        , aggregate_invoices_to_organizations_grain.accepted_payment_amount
        , aggregate_invoices_to_organizations_grain.balance 
        , organizations.first_payment_date
        , organizations.last_payment_date
    from organizations 
    full outer join aggregate_invoices_to_organizations_grain 
    on organizations.organization_id = aggregate_invoices_to_organizations_grain.organization_id
)

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
from organizations_joined_aggregate_invoices_to_organizations_grain