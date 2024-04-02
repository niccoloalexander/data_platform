-- select
--     count(*) as cn
--     , count(i.*)
--     , count(o.*)
--     , count(distinct(i.organization_id))
--     , count(distinct(o.organization_id))
-- from {{ ref('stg_customer__invoices') }} i 
-- full outer join {{ ref('stg_customer__organizations') }} o 
-- on i.organization_id = o.organization_id 

select
    *
from {{ ref('stg_customer__invoices') }} i 
left join {{ ref('stg_customer__organizations') }} o 
on i.organization_id = o.organization_id 
where 
    true 
    -- and i.organization_id is null 
    -- and o.organization_id is null
    -- and first_payment_date - created_date = 0
    -- and first_payment_date = last_payment_date
    -- and o.organization_id = '762041063260980198'
    -- and currency = 'VND'
    and status_type = 'credited'
    -- and amount < payment_amount

select 
    status 
    , count(distinct(transaction_id)) as tranasctions
    , count(distinct(organization_id)) as organizations 
    , sum(amount) as amount 
    , sum(payment_amount) as payment_amount 
from {{ ref('stg_customer__invoices') }}
group by 1 
order by 2 desc 

select 
    invoice_id 
    -- transaction_id
    , count(*)
from {{ ref('stg_customer__invoices') }}
group by 1 
having count(*) > 1 

select 
    *
from {{ ref('stg_customer__invoices') }}
where 
    true 
    -- and transaction_id = '1000008384486390106'

select 
    min(first_payment_date - created_date)
    , avg(first_payment_date - created_date)
    , max(first_payment_date - created_date)
from {{ ref('stg_customer__organizations') }}

select 
    min(first_payment_date - created_date)
    , avg(first_payment_date - created_date)
    , max(first_payment_date - created_date)
from {{ ref('stg_customer__organizations') }}

