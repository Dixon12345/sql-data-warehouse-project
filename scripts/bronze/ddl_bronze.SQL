-- =================================================================
-- SQL Script to Load All Bronze Tables
-- =================================================================
-- This script truncates all bronze tables and reloads them from
-- the source CSV files located in the 'data/' subfolder.
-- It is designed to be executed by the psql client.
-- =================================================================

\echo '=================================================='
\echo '           Loading Bronze Layer'
\echo '=================================================='
\echo ''

-- Loading CRM Tables
\echo '--------------------------------------------------'
\echo 'Loading CRM Tables'
\echo '--------------------------------------------------'

\echo '>> Truncating and Loading: bronze.crm_cust_info'
TRUNCATE TABLE bronze.crm_cust_info RESTART IDENTITY;
\copy bronze.crm_cust_info FROM 'data/source_crm/cust_info.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

\echo '>> Truncating and Loading: bronze.crm_prd_info'
TRUNCATE TABLE bronze.crm_prd_info RESTART IDENTITY;
\copy bronze.crm_prd_info FROM 'data/source_crm/prd_info.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

\echo '>> Truncating and Loading: bronze.crm_sales'
TRUNCATE TABLE bronze.crm_sales RESTART IDENTITY;
\copy bronze.crm_sales FROM 'data/source_crm/sales_details.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

-- Loading ERP Tables
\echo '--------------------------------------------------'
\echo 'Loading ERP Tables'
\echo '--------------------------------------------------'

\echo '>> Truncating and Loading: bronze.erp_cust_info'
TRUNCATE TABLE bronze.erp_cust_info RESTART IDENTITY;
\copy bronze.erp_cust_info FROM 'data/source_erp/CUST_AZ12.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

\echo '>> Truncating and Loading: bronze.erp_cust_location'
TRUNCATE TABLE bronze.erp_cust_location RESTART IDENTITY;
\copy bronze.erp_cust_location FROM 'data/source_erp/LOC_A101.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

\echo '>> Truncating and Loading: bronze.erp_prd_category'
TRUNCATE TABLE bronze.erp_prd_category RESTART IDENTITY;
\copy bronze.erp_prd_category FROM 'data/source_erp/PX_CAT_G1V2.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

\echo '=================================================='
\echo '           Bronze Layer Load Complete'
\echo '=================================================='
