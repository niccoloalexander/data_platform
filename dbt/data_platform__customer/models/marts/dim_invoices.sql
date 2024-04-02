{{ 
    config(
        alias='dim_invoices'
    ) 
}}

select
    invoice_id
    , parent_invoice_id 
    , transaction_id
    , organization_id 
    , type_id 
    , status_type
    , status_definition
    , currency
    , payment_currency
    , payment_method 
    , amount 
    , payment_amount 
    , accepted_payment_amount
    , accrued_revenue
    , realized_revenue
    , balance
    , fx_rate 
    , fx_rate_payment
from {{ ref('int_invoices_enriched') }}