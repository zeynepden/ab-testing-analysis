# A/B Testing Analysis

## Project Overview

This project analyzes an A/B test designed to determine whether a new landing page performs better than the original version in terms of conversion rate.

The analysis combines **SQL for data aggregation** and **Python for statistical testing**.

---

## Business Question

Should the company replace the original landing page with the new version?

---

## Dataset

The dataset contains the following columns:

| Column | Description |
|------|-------------|
| user_id | Unique user identifier |
| group | A = original page, B = new page |
| converted | 1 = user converted, 0 = no conversion |

---

## Methodology

The analysis follows these steps:

1. Load and inspect the dataset  
2. Calculate conversion rates for each group  
3. Compare performance between groups  
4. Run a statistical hypothesis test  
5. Interpret results from a business perspective  

---

## SQL Analysis

SQL was used to compute:

- total users per group
- total conversions
- conversion rates
- performance comparison between groups
- absolute and relative lift

Example SQL aggregation:

    SELECT
        "group",
        COUNT(*) AS total_users,
        SUM(converted) AS total_conversions,
        ROUND(100.0 * SUM(converted) / COUNT(*), 2) AS conversion_rate_pct
    FROM ab_test_data
    GROUP BY "group";

---

## Python Statistical Test

Python was used to perform a **proportion z-test** to determine whether the difference in conversion rate is statistically significant.

Libraries used:

- pandas  
- matplotlib  
- statsmodels  

---

## Key Metrics

The analysis focuses on:

- Conversion Rate  
- Absolute Lift  
- Relative Lift  
- Statistical Significance (p-value)  

---

## Project Structure

    ab-testing-analysis/
    │
    ├── data
    │   └── ab_test_data.csv
    │
    ├── notebooks
    │   └── ab_test_analysis.ipynb
    │
    ├── sql
    │   └── ab_test_analysis.sql
    │
    └── README.md

---

## Tools Used

- SQL  
- Python  
- Pandas  
- Matplotlib  
- Statsmodels  
- GitHub  

---

## Goal

The goal of this project is to demonstrate how data analysts evaluate experiments and support product decisions using **data-driven insights**.
