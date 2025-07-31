/*
================================================
Create Database and Schemas (PostgreSQL Version)
================================================
Script Purpose:
This script creates a new database named 'Datawarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. It also creates the 'bronze',
'silver', and 'gold' schemas.

WARNING:
Running this script will drop the entire 'Datawarehouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution
and ensure you have proper backups before running this script.

Execution Notes:
- To drop a database in PostgreSQL, you cannot be connected to it. Run this script
  while connected to the default 'postgres' database.
- After this script runs, you must manually switch your connection to the new
  'Datawarehouse' database to create tables within the schemas.
*/

-- Terminate all active connections to the 'Datawarehouse' database to allow it to be dropped.
-- This must be run from another database, like the default 'postgres' database.
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'Datawarehouse';

-- Drop the database if it exists
DROP DATABASE IF EXISTS Datawarehouse;

-- Create the database
CREATE DATABASE Datawarehouse;

-- ====================================================================================
-- !! IMPORTANT !!
-- You must now disconnect from the 'postgres' database and reconnect to the newly
-- created 'Datawarehouse' database before running the commands below.
-- ====================================================================================

-- The following commands should be run AFTER reconnecting to the 'Datawarehouse' database.

-- Create Schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
