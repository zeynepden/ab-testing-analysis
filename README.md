# A/B Testing Analysis

## Project Overview
This project analyzes an A/B test designed to determine whether a new landing page performs better than the original version in terms of conversion rate.

## Business Question
Should the company replace the original landing page with the new version?

## Hypothesis
- **H0:** The conversion rate of the new landing page is equal to the old landing page.
- **H1:** The conversion rate of the new landing page is higher than the old landing page.

## Dataset
The dataset contains the following variables:

- **user_id**: unique user identifier
- **group**: A = original page, B = new page
- **converted**: 1 = conversion, 0 = no conversion

## Methodology
The analysis follows these steps:

1. Load and inspect the dataset
2. Calculate conversion rates for Group A and Group B
3. Visualize conversion performance
4. Run a statistical hypothesis test using a proportion z-test
5. Interpret the result from a business perspective

## Tools Used
- Python
- Pandas
- Matplotlib
- Statsmodels
- Jupyter Notebook

## Key Analysis Areas
- Conversion rate comparison
- A/B test evaluation
- Statistical significance testing
- Business recommendation

## Project Structure
```text
ab-testing-analysis/
├── data/
│   └── ab_test_data.csv
├── notebooks/
│   └── ab_test_analysis.ipynb
└── README.md
