-- Task 1: Load data

-- Create database
DROP DATABASE IF EXISTS pandemic;
CREATE DATABASE IF NOT EXISTS pandemic;

-- Create schema
CREATE SCHEMA IF NOT EXISTS pandemic;

-- Set as default schema
USE pandemic;

-- Import data from CSV file

-- View the data
SELECT * FROM infectious_cases LIMIT 100;

-- Check total record count
SELECT COUNT(*) FROM infectious_cases;