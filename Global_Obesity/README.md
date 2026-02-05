# README


## Overview
This repository contains work for my `Data Analysis Dashboard for Analyzing Global Obesity Trends` project.


## Goals
The main research question is to analyze the mean trend of obesity percentage in the world based on certain attributes, such as biological sex or geographical region.

Besides answering these research questions, I also have coding-based goals I want to tackle, such as:
- Using SQL to do various tasks, such as applying relational databases to store data, wrangling data, and ETL techniques
- Utilizing Tableau to create informative and aesthetically pleasing graphics to analyze research questions


## Tech Stack
- SQL (SQLite, DB Browser for SQLite)
- Tableau (Tableau Desktop)


## Features
This project contains the following:
- Code for data wrangling, queries, ETL, and other tasks (located in the `code` folder)
- Graphics from Tableau Dashboard (located in the `graphs` folder)


## Instructions
To run the following project on your own device, please refer to the following steps:
1. Obtain obesity from [Kaggle](https://www.kaggle.com/datasets/amanarora/obesity-among-adults-by-country-19752016/data) and information about region [data](https://cdn.who.int/media/docs/default-source/air-pollution-documents/air-quality-and-health/un-agencies-region-classification-for-country.xlsx?sfvrsn=289af35f_3)
  - Please refer to the `Data` section under `Sources` for more context on where this information came from
2. Load in data into database with `load_data.sql`
3. Wrangle / clean / adjust / combine data with `wrangle_data.sql`
4. Group / process data based on certain attributes (i.e., region) with `group_data.sql`
5. Use tables produced in Tableau to graph trends and other relationships


## Results
In general, the mean obesity percentage in each country increased overtime regardless of other attributes, such as biological sex or region. The graphs depict that mean obesity percentage is higher for people in the Oceania region and for females. 


## Improvements
There are various improvements that can be made for this project. For example:
- Find or define region names for NULL values (i.e., countries where the WHO region information utilized does NOT have a region name for them)
- Take into account the population of females vs males to analyze if obesity values are heavily skewed by the total number of people present
- Include more recent obesity data
- Improve graphics to be more aesthetically pleasing


## Sources
This section contains resources that was used to collect the data and to provide information on certain coding parts.


### Data
- The obesity data is a Kaggle dataset containing WHO obesity information collected by Aman Arora (https://www.kaggle.com/datasets/amanarora/obesity-among-adults-by-country-19752016/data)
- The region data is from WHO (https://cdn.who.int/media/docs/default-source/air-pollution-documents/air-quality-and-health/un-agencies-region-classification-for-country.xlsx?sfvrsn=289af35f_3)

### Tutorials
The following links were used to help with the coding aspects of the project.
- https://www.w3schools.com/sql/sql_create_table.asp 
- https://www.w3schools.com/sql/sql_delete.asp
- https://www.w3schools.com/sql/sql_where.asp 
- https://www.w3schools.com/sql/sql_alter.asp 
- https://www.stratascratch.com/blog/how-to-create-pivots-in-sql/ 
- https://kaicui726.medium.com/advanced-sql-reshaping-tables-d80c81e3fd9e
- https://www.sqlite.org/lang_altertable.html 
- https://www.w3schools.com/sql/func_mysql_substr.asp 
- https://www.w3schools.com/sql/func_sqlserver_cast.asp
- https://www.geeksforgeeks.org/sqlite/how-to-split-a-delimited-string-to-access-individual-items-in-sqlite/ 
- https://www.w3schools.com/sql/sql_groupby.asp
- https://www.w3schools.com/sql/sql_avg.asp
- https://www.sqlite.org/pragma.html
- https://www.sqlite.org/lang_keywords.html
- https://help.tableau.com/current/pro/desktop/en-us/buildexamples_line.htm 
- https://help.tableau.com/current/guides/get-started-tutorial/en-us/get-started-tutorial-home.htm
- https://help.tableau.com/current/guides/get-started-tutorial/en-us/get-started-tutorial-connect.htm
- https://help.tableau.com/current/guides/get-started-tutorial/en-us/get-started-tutorial-drag.htm
- https://help.tableau.com/current/guides/get-started-tutorial/en-us/get-started-tutorial-focus.htm
- https://help.tableau.com/current/guides/get-started-tutorial/en-us/get-started-tutorial-explore.htm
- https://help.tableau.com/current/guides/get-started-tutorial/en-us/get-started-tutorial-drilldown.htm
- https://help.tableau.com/current/guides/get-started-tutorial/en-us/get-started-tutorial-build.htm
- https://help.tableau.com/current/guides/get-started-tutorial/en-us/get-started-tutorial-story.htm
