{% snapshot invoices_snapshot %}

{{
    config(
      unique_key='invoice_id'
      , strategy='check'
      , check_cols=['status', 'payment_amount']
    )
}}

select * from {{ source('customer', 'raw_invoices') }}

{% endsnapshot %}