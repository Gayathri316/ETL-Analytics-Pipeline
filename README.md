# ETL Analytics Pipeline & Business Intelligence Dashboard

## Project Overview

This project demonstrates an end-to-end data analytics workflow that extracts business sales data from CSV files, cleans and transforms the data using Python and Pandas, loads the processed data into a MySQL database, performs SQL-based analysis, and visualizes business KPIs through an interactive Power BI dashboard.

## Project Architecture

CSV Dataset
    ↓
Python + Pandas
    ↓
Data Cleaning & Transformation
    ↓
Cleaned CSV
    ↓
MySQL Database
    ↓
SQL Analysis
    ↓
Power BI Dashboard

## ETL Process

### 1. Extract

Business sales data is extracted from a CSV file using Pandas.

The dataset contains information such as:

- Order ID
- Order Date
- Customer ID
- Product
- Region
- Quantity
- Unit Price
- Discount
- Category
- Sales
- Profit

### 2. Transform

The data is cleaned and validated using Pandas.

The transformation process includes:

- Missing value detection
- Missing value handling
- Duplicate record removal
- Data validation
- Statistical analysis
- Saving the cleaned dataset

For missing values:

- Missing Region values are replaced with `Unknown`
- Missing Customer IDs are handled appropriately
- Missing Unit Price values are replaced using the median

### 3. Load

The cleaned dataset is loaded into a MySQL database.

Database:

`sales_analytics`

Table:

`sales`

Python MySQL Connector is used to load the processed data into MySQL.

## SQL Analysis

SQL queries are used to analyze:

- Total Sales
- Total Profit
- Total Orders
- Sales by Category
- Sales by Region
- Top-performing products
- Profitability metrics

## Power BI Dashboard

The Power BI dashboard provides interactive business analysis using:

### KPIs

- Total Sales
- Total Profit
- Total Orders
- Profit Margin %

### Visualizations

- Monthly Sales Trend
- Sales by Category
- Profit by Category
- Sales by Region
- Top 5 Products by Sales

### Filters

- Region
- Category

The dashboard allows users to interactively filter the data and observe changes in KPIs and visualizations.

## Key Business Metrics

The dashboard calculates:

**Total Sales**

```text
SUM(Sales)