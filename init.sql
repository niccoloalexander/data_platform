-- Create schema
create schema if not exists raw;

-- Create table for invoices CSV
create table if not exists raw.raw_invoices (
    INVOICE_ID varchar
    , parent_invoice_id varchar
    , transaction_id varchar
    , organization_id varchar
    , type varchar
    , status varchar
    , currency varchar
    , payment_currency varchar
    , payment_method varchar
    , amount varchar
    , payment_amount varchar
    , fx_rate varchar
    , fx_rate_payment varchar
);

-- Load data from invoices CSV
copy raw.raw_invoices from '/csv_data/invoices.csv' delimiter ',' csv header;

-- Create table for organizations CSV
create table if not exists raw.raw_organizations (
    organization_id varchar
    , first_payment_date varchar 
    , last_payment_date varchar 
    , legal_entity_country_code varchar 
    , count_total_contracts_active varchar 
    , created_date varchar
);

-- Load data from organizations CSV
copy raw.raw_organizations from '/csv_data/organizations.csv' delimiter ',' csv header;
