# Schema Definitions

## Models 

{% docs customer__invoices %}
Invoices made to customer organizations with transaction information. Standard amounts are in USD.
{% enddocs %}

{% docs customer__organizations %}
Customer organizations with payment contract and accompanying information.
{% enddocs %}

{% docs invoice_enrichment %}
Reference for invoices by status type. Each status type is accompanied by a definition as well as coefficients on amounts for the computation of balance, accrued revenue (cost), or realized revenue (cost).
{% enddocs %}

{% docs dim_invoices %}
Invoices made to customer organizations with source transaction information. Enriched with status definitions, revenue, and invoice balance. Standard amounts are in USD.
{% enddocs %}

{% docs dim_organizations %}
Customer organizations with payment contract and accompanying information. Enriched with revenue and balance. Amounts are in USD.
{% enddocs %}

{% docs fct_organization_daily_financials %}
Daily record of customer organization financial metrics.
{% enddocs %}

{% docs expose_fct_organization_daily_financials %}
The operations team is alerted when a customer organization has a 50% change in daily balance.
{% enddocs %}

## Fields

{% docs customer__invoice_id %}
Unique identifier for each invoice.
{% enddocs %}

{% docs customer__parent_invoice_id %}
Identifier for the parent invoice, if applicable.
{% enddocs %}

{% docs customer__transaction_id %}
Identifier for the transaction associated with the invoice.
{% enddocs %}

{% docs customer__organization_id %}
Identifier for the organization associated with the invoice.
{% enddocs %}

{% docs customer__type %}
Type of invoice.
{% enddocs %}

{% docs customer__invoice_status %}
Status of the payment.
{% enddocs %}

{% docs customer__currency %}
Currency used for the invoice.
{% enddocs %}

{% docs customer__payment_currency %}
Currency used for the payment.
{% enddocs %}

{% docs customer__payment_method %}
Method used for the payment.
{% enddocs %}

{% docs customer__amount %}
Total amount of the invoice in USD.
{% enddocs %}

{% docs customer__payment_amount %}
Amount paid for the invoice in USD.
{% enddocs %}

{% docs customer__fx_rate %}
Foreign exchange rate used for currency conversion.
{% enddocs %}

{% docs customer__fx_rate_payment %}
Foreign exchange rate used for payment currency conversion.
{% enddocs %}

{% docs customer__first_payment_date %}
Date of the first payment made by the organization.
{% enddocs %}

{% docs customer__last_payment_date %}
Date of the last payment made by the organization.
{% enddocs %}

{% docs customer__legal_entity_country_code %}
Country code for the legal entity associated with the organization.
{% enddocs %}

{% docs customer__count_total_contracts_active %}
Total number of contracts the organization has active.
{% enddocs %}

{% docs customer__created_date %}
Date when the organization was created.
{% enddocs %}

{% docs invoice_status_definition %}
Definition of an invoice status type.
{% enddocs %}

{% docs amount_coefficient %}
Coefficient applied to invoice amount when computing for customer balance or our accrued revenue (cost).
{% enddocs %}

{% docs payment_amount_coefficient %}
Coefficient applied to invoice payment amount when computing for balance or our realized revenue (cost).
{% enddocs %}

{% docs is_final %}
Indicator that an invoice has been finalized. Used to measure realized revenue.
{% enddocs %}

{% docs accrued_revenue %}
Revenue (cost) measured from amounts invoiced to customers.
{% enddocs %}

{% docs realized_revenue %}
Revenue (cost) measured from amounts successfully paid by (to) customers.
{% enddocs %} 

{% docs accepted_payment_amount %}
Accepted amount paid for the invoice in USD. Used to deduct from accrued revenue to measure balance.
{% enddocs %}

{% docs balance %}
The amount owed by or to the customer. Measured by subtracting accepted_payment_amount from accrued_revenue.
{% enddocs %}

{% docs previous_balance %}
The amount owed by or to the customer as of the day before recording. Measured by subtracting accepted_payment_amount from accrued_revenue.
{% enddocs %}

{% docs balance_change_rate %}
The change rate from the balance yesterday to the balance today.
{% enddocs %}

{% docs record_id %}
Unique record id for the dataset.
{% enddocs %}

{% docs recorded_date %}
Date that the record was created.
{% enddocs %}

{% docs recorded_at %}
Date and time that the record was created.
{% enddocs %}