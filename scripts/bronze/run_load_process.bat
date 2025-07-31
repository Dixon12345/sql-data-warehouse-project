@echo off
REM =================================================================
REM  Windows Batch File to Automate the Bronze Data Load
REM =================================================================
REM Purpose:
REM This script automatically runs the 'load_bronze_data.sql' file,
REM stops immediately if any error occurs, and reports the total
REM time taken to complete the process.
REM
REM Instructions:
REM 1. Make sure this file is in the same folder as 'load_bronze_data.sql'.
REM 2. IMPORTANT: Replace 'your_password_here' with your actual
REM    PostgreSQL user password.
REM 3. Double-click this file to execute the entire data load process.
REM =================================================================

echo.
echo Setting database connection details...
echo.

:: Set the connection variables for your PostgreSQL database
set PGHOST=localhost
set PGPORT=5432
set PGUSER=postgres
set PGDATABASE=datawarehouse
set PGPASSWORD=Replace your passoword here

:: Record the start time in total hundredths of a second
set /a "START_TIME_HS=(1%TIME:~0,2%-100)*360000 + (1%TIME:~3,2%-100)*6000 + (1%TIME:~6,2%-100)*100 + (1%TIME:~9,2%-100)"

echo =================================================
echo Starting the data load process for the Bronze layer...
echo Start Time: %TIME%
echo =================================================
echo.

:: Execute the SQL script using the psql tool.
:: The '-f' flag tells psql to run the specified file.
:: The '-v ON_ERROR_STOP=1' flag is our "TRY...CATCH". It forces
:: the script to exit immediately if any command fails.
psql -f "load_bronze_data.sql" -v ON_ERROR_STOP=1

:: Check the result of the last command
if %ERRORLEVEL% neq 0 (
    echo.
    echo =================================================
    echo !!! ETL PROCESS FAILED !!!
    echo An error occurred. Please check the messages above.
    echo =================================================
) else (
    echo.
    echo =================================================
    echo    ETL PROCESS COMPLETED SUCCESSFULLY
    echo =================================================
)

:: Record the end time in total hundredths of a second
set /a "END_TIME_HS=(1%TIME:~0,2%-100)*360000 + (1%TIME:~3,2%-100)*6000 + (1%TIME:~6,2%-100)*100 + (1%TIME:~9,2%-100)"

:: Calculate the duration
set /a "DURATION_HS = END_TIME_HS - START_TIME_HS"
set /a "DURATION_S = DURATION_HS / 100"
set /a "DURATION_MS = DURATION_HS %% 100"

echo.
echo Start Time: %TIME%
echo End Time:   %TIME%
echo.
echo Total Time Taken: %DURATION_S%.%DURATION_MS% seconds
echo.
pause
