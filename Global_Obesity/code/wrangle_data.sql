-- This file focuses on cleaning and joining relational databases together

-- Cleaning Section --
-- 1. Make a copy of raw data and delete first two rows 
CREATE TABLE obesity_data AS SELECT * FROM obesity_data_raw;

DELETE FROM obesity_data 
WHERE field2 IN ('18+  years', 'Prevalence of obesity among adults, BMI &GreaterEqual; 30 (age-standardized estimate) (%)');


-- 2. Change row names (include Country, Year_sexType)
---- Follows a pattern (2016 --> 1975) and (Both, Male, Female)
---- Since I need to do this for a lot of columns, make a new table incase there is an error
CREATE TABLE obesity_data2 AS SELECT 
  field1 as field, 
  field2 as both_2016,
  field3 as male_2016, 
  field4 as female_2016,
  
  field5 as both_2015,
  field6 as male_2015, 
  field7 as female_2015,
  
  field8 as both_2014,
  field9 as male_2014, 
  field10 as female_2014,
  
  field11 as both_2013,
  field12 as male_2013, 
  field13 as female_2013,
  
  field14 as both_2012,
  field15 as male_2012, 
  field16 as female_2012,
  
  field17 as both_2011,
  field18 as male_2011, 
  field19 as female_2011,
  
  field20 as both_2010,
  field21 as male_2010, 
  field22 as female_2010,
  
  field23 as both_2009,
  field24 as male_2009, 
  field25 as female_2009,
  
  field26 as both_2008,
  field27 as male_2008, 
  field28 as female_2008,
  
  field29 as both_2007,
  field30 as male_2007, 
  field31 as female_2007,
  
  field32 as both_2006,
  field33 as male_2006, 
  field34 as female_2006,
  
  field35 as both_2005,
  field36 as male_2005, 
  field37 as female_2005,
  
  field38 as both_2004,
  field39 as male_2004, 
  field40 as female_2004,
  
  field41 as both_2003,
  field42 as male_2003, 
  field43 as female_2003,
  
  field44 as both_2002,
  field45 as male_2002, 
  field46 as female_2002,
  
  field47 as both_2001,
  field48 as male_2001, 
  field49 as female_2001,
  
  field50 as both_2000,
  field51 as male_2000, 
  field52 as female_2000,
  
  field53 as both_1999,
  field54 as male_1999, 
  field55 as female_1999,
  
  field56 as both_1998,
  field57 as male_1998, 
  field58 as female_1998,
  
  field59 as both_1997,
  field60 as male_1997, 
  field61 as female_1997,
  
  field62 as both_1996,
  field63 as male_1996, 
  field64 as female_1996,
  
  field65 as both_1995,
  field66 as male_1995, 
  field67 as female_1995,
  
  field68 as both_1994,
  field69 as male_1994, 
  field70 as female_1994,
  
  field71 as both_1993,
  field72 as male_1993, 
  field73 as female_1993,
  
  field74 as both_1992,
  field75 as male_1992, 
  field76 as female_1992,
  
  field77 as both_1991,
  field78 as male_1991, 
  field79 as female_1991,
  
  field80 as both_1990,
  field81 as male_1990, 
  field82 as female_1990,
  
  field83 as both_1989,
  field84 as male_1989, 
  field85 as female_1989,
  
  field86 as both_1988,
  field87 as male_1988, 
  field88 as female_1988,
  
  field89 as both_1987,
  field90 as male_1987, 
  field91 as female_1987,
  
  field92 as both_1986,
  field93 as male_1986, 
  field94 as female_1986,
  
  field95 as both_1985,
  field96 as male_1985, 
  field97 as female_1985,
  
  field98 as both_1984,
  field99 as male_1984, 
  field100 as female_1984,
  
  field101 as both_1983,
  field102 as male_1983, 
  field103 as female_1983,
  
  field104 as both_1982,
  field105 as male_1982, 
  field106 as female_1982,
  
  field107 as both_1981,
  field108 as male_1981, 
  field109 as female_1981,
  
  field110 as both_1980,
  field111 as male_1980, 
  field112 as female_1980,
  
  field113 as both_1979,
  field114 as male_1979, 
  field115 as female_1979,
  
  field116 as both_1978,
  field117 as male_1978, 
  field118 as female_1978,
  
  field119 as both_1977,
  field120 as male_1977, 
  field121 as female_1977,
  
  field122 as both_1976,
  field123 as male_1976, 
  field124 as female_1976,
  
  field125 as both_1975,
  field126 as male_1975, 
  field127 as female_1975
 
 FROM obesity_data;
 
 
 -- 3. Remove first two rows and rename first column to be 'Country'
DELETE FROM obesity_data2 
WHERE both_2016 IN (2016, 'Both sexes');

ALTER TABLE obesity_data2 RENAME COLUMN field TO Country;


-- 4. Pivot data from wide to long
CREATE TABLE obesity_data3 AS SELECT
    Country,
    'both_2016' AS Year,
    both_2016 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2016' AS Year,
    male_2016 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2016' AS Year,
    female_2016 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2015' AS Year,
    both_2015 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2015' AS Year,
    male_2015 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2015' AS Year,
    female_2015 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2014' AS Year,
    both_2014 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2014' AS Year,
    male_2014 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2014' AS Year,
    female_2014 AS Obesity
FROM
    obesity_data2

UNION ALL

SELECT
    Country,
    'both_2013' AS Year,
    both_2013 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2013' AS Year,
    male_2013 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2013' AS Year,
    female_2013 AS Obesity
FROM
    obesity_data2

UNION ALL

SELECT
    Country,
    'both_2012' AS Year,
    both_2012 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2012' AS Year,
    male_2012 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2012' AS Year,
    female_2012 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2011' AS Year,
    both_2011 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2011' AS Year,
    male_2011 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2011' AS Year,
    female_2011 AS Obesity
FROM
    obesity_data2

UNION ALL
    
SELECT
    Country,
    'both_2010' AS Year,
    both_2010 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2010' AS Year,
    male_2010 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2010' AS Year,
    female_2010 AS Obesity
FROM
    obesity_data2

UNION ALL

SELECT
    Country,
    'both_2009' AS Year,
    both_2009 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2009' AS Year,
    male_2009 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2009' AS Year,
    female_2009 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2008' AS Year,
    both_2008 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2008' AS Year,
    male_2008 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2008' AS Year,
    female_2008 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2007' AS Year,
    both_2007 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2007' AS Year,
    male_2007 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2007' AS Year,
    female_2007 AS Obesity
FROM
    obesity_data2

UNION ALL

SELECT
    Country,
    'both_2006' AS Year,
    both_2006 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2006' AS Year,
    male_2006 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2006' AS Year,
    female_2006 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2005' AS Year,
    both_2005 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2005' AS Year,
    male_2005 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2005' AS Year,
    female_2005 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2004' AS Year,
    both_2004 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2004' AS Year,
    male_2004 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2004' AS Year,
    female_2004 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2003' AS Year,
    both_2003 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2003' AS Year,
    male_2003 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2003' AS Year,
    female_2003 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2002' AS Year,
    both_2002 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2002' AS Year,
    male_2002 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2002' AS Year,
    female_2002 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2001' AS Year,
    both_2001 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2001' AS Year,
    male_2001 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2001' AS Year,
    female_2001 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_2000' AS Year,
    both_2000 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_2000' AS Year,
    male_2000 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_2000' AS Year,
    female_2000 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1999' AS Year,
    both_1999 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1999' AS Year,
    male_1999 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1999' AS Year,
    female_1999 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1998' AS Year,
    both_1998 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1998' AS Year,
    male_1998 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1998' AS Year,
    female_1998 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1998' AS Year,
    both_1998 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1998' AS Year,
    male_1998 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1998' AS Year,
    female_1998 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1997' AS Year,
    both_1997 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1997' AS Year,
    male_1997 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1997' AS Year,
    female_1997 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1996' AS Year,
    both_1996 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1996' AS Year,
    male_1996 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1996' AS Year,
    female_1996 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1995' AS Year,
    both_1995 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1995' AS Year,
    male_1995 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1995' AS Year,
    female_1995 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1994' AS Year,
    both_1994 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1994' AS Year,
    male_1994 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1994' AS Year,
    female_1994 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1993' AS Year,
    both_1993 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1993' AS Year,
    male_1993 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1993' AS Year,
    female_1993 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1992' AS Year,
    both_1992 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1992' AS Year,
    male_1992 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1992' AS Year,
    female_1992 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1991' AS Year,
    both_1991 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1991' AS Year,
    male_1991 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1991' AS Year,
    female_1991 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1990' AS Year,
    both_1990 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1990' AS Year,
    male_1990 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1990' AS Year,
    female_1990 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1989' AS Year,
    both_1989 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1989' AS Year,
    male_1989 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1989' AS Year,
    female_1989 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1988' AS Year,
    both_1988 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1988' AS Year,
    male_1988 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1988' AS Year,
    female_1988 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1987' AS Year,
    both_1987 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1987' AS Year,
    male_1987 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1987' AS Year,
    female_1987 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1986' AS Year,
    both_1986 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1986' AS Year,
    male_1986 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1986' AS Year,
    female_1986 AS Obesity
FROM
    obesity_data2

UNION ALL

SELECT
    Country,
    'both_1985' AS Year,
    both_1985 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1985' AS Year,
    male_1985 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1985' AS Year,
    female_1985 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1984' AS Year,
    both_1984 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1984' AS Year,
    male_1984 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1984' AS Year,
    female_1984 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1983' AS Year,
    both_1983 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1983' AS Year,
    male_1983 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1983' AS Year,
    female_1983 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1982' AS Year,
    both_1982 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1982' AS Year,
    male_1982 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1982' AS Year,
    female_1982 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1981' AS Year,
    both_1981 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1981' AS Year,
    male_1981 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1981' AS Year,
    female_1981 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1980' AS Year,
    both_1980 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1980' AS Year,
    male_1980 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1980' AS Year,
    female_1980 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1979' AS Year,
    both_1979 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1979' AS Year,
    male_1979 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1979' AS Year,
    female_1979 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1978' AS Year,
    both_1978 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1978' AS Year,
    male_1978 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1978' AS Year,
    female_1978 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1977' AS Year,
    both_1977 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1977' AS Year,
    male_1977 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1977' AS Year,
    female_1977 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1976' AS Year,
    both_1976 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1976' AS Year,
    male_1976 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1976' AS Year,
    female_1976 AS Obesity
FROM
    obesity_data2
    
UNION ALL

SELECT
    Country,
    'both_1975' AS Year,
    both_1975 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'male_1975' AS Year,
    male_1975 AS Obesity
FROM
    obesity_data2
UNION ALL
SELECT
    Country,
    'female_1975' AS Year,
    female_1975 AS Obesity
FROM
    obesity_data2; 

    
-- 5. Split information about obesity % into relevant columns
 -- Split the 'Year' column so that sex and year are separated    
CREATE TABLE obesity_data4 AS SELECT
    Country, 
    Obesity, 
    substr(Year, 1, instr(Year, '_') - 1) AS Sex,
    substr(Year, instr(Year, '_') + 1) AS Year
FROM
    obesity_data3;

-- Split the Obesity column so that average, lower end, and upper end are separated
CREATE TABLE obesity_data5 AS SELECT
    Country, 
    Obesity,
    Sex,
    Year, 
    substr(Obesity, 1, instr(Obesity, '[') - 2) AS Mean, 
    substr(substr(Obesity, instr(Obesity, '[') + 1), 1, instr(substr(Obesity, instr(Obesity, '[') + 1), '-') - 1) AS Lower_Bound,
    substr(substr(Obesity, instr(Obesity, '-') + 1), 1, instr(substr(Obesity, instr(Obesity, '-') + 1), ']') - 1) AS Upper_Bound
FROM
    obesity_data4;
    
-- Convert Year and all Obesity values to numbers
CREATE TABLE obesity_data6 AS SELECT
  Country,
  CAST(Sex AS TEXT), 
  CAST(Year AS INTEGER),
  CAST(Mean AS REAL),
  CAST(Lower_Bound AS REAL), 
  CAST(Upper_Bound AS REAL)
FROM
  obesity_data5;  
  
PRAGMA table_info(obesity_data6);


-- 6. Use another csv file to add region information (only select needed columns) 
-- Used the following website to collect WHO region labels for each country: https://cdn.who.int/media/docs/default-source/air-pollution-documents/air-quality-and-health/un-agencies-region-classification-for-country.xlsx?sfvrsn=289af35f_3
-- Going to use a LEFT JOIN to merge data together (only need Country and Region name from second csv file)
CREATE TABLE country_regions2 AS
SELECT "UNSD Country name", "UNSD Region name"
FROM country_regions;


-- 7. Left join data together
CREATE TABLE merge_table1 AS SELECT *
FROM obesity_data6
LEFT JOIN country_regions2 ON obesity_data6.Country = country_regions2."UNSD Country name";


-- 8. Clean joined data by renaming columns
CREATE TABLE merge_table2 AS 
SELECT Country,
"CAST(Sex as TEXT)" AS Sex,
"CAST(Year as INTEGER)" AS Year,
"CAST(Mean as REAL)" AS Mean,
"CAST(Lower_Bound as REAL)" AS Lower_Bound,
"CAST(Upper_Bound as REAL)" AS Upper_Bound,
"UNSD Region name" AS Region 
FROM merge_table1;


-- 9. End of cleaning process
-- Saving final table of interest as a different name (cleaned_data), use this in analysis
CREATE TABLE cleaned_data AS
SELECT * FROM merge_table2;

