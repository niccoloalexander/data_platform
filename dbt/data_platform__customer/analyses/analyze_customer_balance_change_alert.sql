{{ 
    config(
        pre_hook='{{ check_customer_balance_change_alert() }}'
    ) 
}}

select {{ database }}.dev.check_customer_balance_change_alert(0.5)