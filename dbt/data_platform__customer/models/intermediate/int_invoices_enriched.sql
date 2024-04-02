with invoices as (
    select * 
    from {{ ref('stg_customer__invoices') }}
)
, invoice_enrichment as (
    select 
        in_status_type
        , out_status_definition
        , out_amount_coefficient
        , out_payment_amount_coefficient
        , out_is_final
    from {{ ref('invoice_enrichment') }}  
)
, invoices_enriched_with_status_and_revenue as (
    select 
        invoices.invoice_id 
        , invoices.parent_invoice_id 
        , invoices.transaction_id
        , invoices.organization_id 
        , invoices.type_id 
        , invoices.status_type
        , invoice_enrichment.out_status_definition as status_definition
        , invoices.currency
        , invoices.payment_currency
        , invoices.payment_method 
        , invoices.amount 
        , invoices.payment_amount 
        , invoice_enrichment.out_amount_coefficient * invoices.amount as accrued_revenue
        , case 
            when invoice_enrichment.out_is_final
                then invoice_enrichment.out_payment_amount_coefficient * invoices.payment_amount 
            else null 
        end as realized_revenue
        , coalesce(invoice_enrichment.out_payment_amount_coefficient * invoices.payment_amount, 0) as accepted_payment_amount
        , invoices.fx_rate 
        , invoices.fx_rate_payment
    from invoices 
    left join invoice_enrichment 
    on invoices.status_type = invoice_enrichment.in_status_type 
)
, invoices_further_enriched_with_balance as (
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
        , accrued_revenue - accepted_payment_amount as balance
        , fx_rate 
        , fx_rate_payment
    from invoices_enriched_with_status_and_revenue
)

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
from invoices_further_enriched_with_balance