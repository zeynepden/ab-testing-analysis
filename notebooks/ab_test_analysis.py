import pandas as pd
import matplotlib.pyplot as plt
from statsmodels.stats.proportion import proportions_ztest

# Load dataset
df = pd.read_csv("data/ab_test_data.csv")

# Conversion rate calculation
conversion_rates = df.groupby("group")["converted"].mean()
print("Conversion Rates:")
print(conversion_rates)

# Visualization
conversion_rates.plot(kind="bar")
plt.title("Conversion Rate by Group")
plt.ylabel("Conversion Rate")
plt.show()

# Statistical test
counts = df.groupby("group")["converted"].sum()
nobs = df.groupby("group")["converted"].count()

z_stat, p_value = proportions_ztest(count=counts, nobs=nobs)

print("Z-statistic:", z_stat)
print("P-value:", p_value)
