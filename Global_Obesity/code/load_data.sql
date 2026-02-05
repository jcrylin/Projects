-- Creates copies of all raw data of interest

-- Make sure to NOT have 1st row as header setting on due to duplication
CREATE TABLE obesity_data AS SELECT * FROM obseity_data_raw;

-- Original file is in xlsx format, convert to csv with Excel
CREATE TABLE country_regions AS SELECT * FROM country_regions_raw;