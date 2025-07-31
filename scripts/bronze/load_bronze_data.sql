/*
==================================================================
SQL Script to Load All Bronze Tables with Logging (Corrected)
==================================================================
This script is executed by the 'run_load_process.bat' file.
It uses the '\echo' meta-command to print progress messages and
the '\copy' command to load data from local CSV files.
*/

-- Main Header
\echo '=================================================='
\echo '           Loading Bronze Layer'
\echo '=================================================='
\echo ''

-------------------------------------------------------------------
-- Loading CRM Tables
-------------------------------------------------------------------
\echo '--------------------------------------------------'
\echo 'Loading CRM Tables'
\echo '--------------------------------------------------'

-- crm_cust_info
\echo '>> Truncating Table: bronze.crm_cust_info'
TRUNCATE TABLE bronze.crm_cust_info RESTART IDENTITY;
\echo '>> Inserting Data Into: bronze.crm_cust_info'
\copy bronze.crm_cust_info FROM 'C:/Users/dixon/Downloads/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

-- crm_prd_info
\echo '>> Truncating Table: bronze.crm_prd_info'
TRUNCATE TABLE bronze.crm_prd_info RESTART IDENTITY;
\echo '>> Inserting Data Into: bronze.crm_prd_info'
\copy bronze.crm_prd_info FROM 'C:/Users/dixon/Downloads/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

-- crm_sales
\echo '>> Truncating Table: bronze.crm_sales'
TRUNCATE TABLE bronze.crm_sales RESTART IDENTITY;
\echo '>> Inserting Data Into: bronze.crm_sales'
\copy bronze.crm_sales FROM 'C:/Users/dixon/Downloads/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

-------------------------------------------------------------------
-- Loading ERP Tables
-------------------------------------------------------------------
\echo '--------------------------------------------------'
\echo 'Loading ERP Tables'
\echo '--------------------------------------------------'

-- erp_cust_info
\echo '>> Truncating Table: bronze.erp_cust_info'
TRUNCATE TABLE bronze.erp_cust_info RESTART IDENTITY;
\echo '>> Inserting Data Into: bronze.erp_cust_info'
\copy bronze.erp_cust_info FROM 'C:/Users/dixon/Downloads/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

-- erp_cust_location
\echo '>> Truncating Table: bronze.erp_cust_location'
TRUNCATE TABLE bronze.erp_cust_location RESTART IDENTITY;
\echo '>> Inserting Data Into: bronze.erp_cust_location'
\copy bronze.erp_cust_location FROM 'C:/Users/dixon/Downloads/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

-- erp_prd_category
\echo '>> Truncating Table: bronze.erp_prd_category'
TRUNCATE TABLE bronze.erp_prd_category RESTART IDENTITY;
\echo '>> Inserting Data Into: bronze.erp_prd_category'
\copy bronze.erp_prd_category FROM 'C:/Users/dixon/Downloads/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');
\echo ''

\echo '=================================================='
\echo '           Bronze Layer Load Complete'
\echo '=================================================='
