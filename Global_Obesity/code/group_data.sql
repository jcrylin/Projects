-- This file focuses on grouping / filtering / compressing certain values to get more information under certain conditions (i.e., region)
-- Generates new table incase I want to plot these values later

PRAGMA table_info(cleaned_data); -- checking datatypes of all columns


-- 1. Analyzing the obesity% of people each year per region (do it when sex does and does NOT matter)
CREATE TABLE analysis_perRegion AS SELECT 
  Sex, 
  Year, 
  Region,
  AVG(Mean) AS Mean_Region,
  AVG(Lower_Bound) AS Lower_Bound_Region,
  AVG(Upper_Bound) AS Upper_Bound_Region
FROM cleaned_data
GROUP BY Region, Year, Sex;


-- 2. Analyzing the obesity% of people per year (regardless of country and with sex mattering and not mattering)
CREATE TABLE analysis_perYear AS SELECT 
  Sex, 
  Year, 
  AVG(Mean) AS Mean,
  AVG(Lower_Bound) AS Lower_Bound,
  AVG(Upper_Bound) AS Upper_Bound
FROM cleaned_data
GROUP BY Year, Sex;




