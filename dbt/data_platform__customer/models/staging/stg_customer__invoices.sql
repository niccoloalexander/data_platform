{{ 
    config(
        alias='stg_invoices'
    ) 
}}

with source_data as (
    select 
        trim(invoice_id::varchar) as invoice_id 
        , trim(parent_invoice_id::varchar) as parent_invoice_id 
        , trim(transaction_id::varchar) as transaction_id
        , trim(organization_id::varchar) as organization_id 
        , trim(type::varchar) as type_id 
        , trim(status::varchar) as status_type
        , trim(currency::char(3)) as currency
        , trim(payment_currency::char(3)) as payment_currency
        , trim(payment_method::varchar) as payment_method 
        , amount::numeric(12, 2) as amount 
        , payment_amount::numeric(12, 2) as payment_amount 
        , fx_rate::decimal as fx_rate 
        , fx_rate_payment::decimal as fx_rate_payment
        , current_date::date as generated_date
        -- , current_time::timestamp as generated_at
    from {{ source('postgres', 'raw_invoices') }}
)

select *
from source_data