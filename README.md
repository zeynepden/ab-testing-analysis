# A/B Testing Analysis

## Project Overview

This project analyzes an A/B test designed to evaluate whether a new landing page improves conversion rate.

## Hypothesis

H0: The conversion rate of the new landing page is equal to the old page.

H1: The conversion rate of the new landing page is higher than the old page.

## Dataset

The dataset contains:

- user_id
- group (A = original page, B = new page)
- converted (1 = conversion, 0 = no conversion)

## Methodology

1. Load and inspect the dataset
2. Calculate conversion rates for both groups
3. Visualize performance differences
4. Conduct a statistical hypothesis test (proportion z-test)

## Tools

- Python
- Pandas
- Matplotlib
- Statsmodels

## Goal

Determine whether the new landing page should replace the original one based on statistical significance.
