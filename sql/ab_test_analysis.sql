-- A/B Test Summary by Group

SELECT
    "group",
    COUNT(*) AS total_users,
    SUM(converted) AS total_conversions,
    ROUND(100.0 * SUM(converted) / COUNT(*), 2) AS conversion_rate_pct
FROM ab_test_data
GROUP BY "group";


-- A/B Test Comparison

SELECT
    MAX(CASE WHEN "group" = 'A' THEN total_users END) AS users_A,
    MAX(CASE WHEN "group" = 'A' THEN total_conversions END) AS conversions_A,
    MAX(CASE WHEN "group" = 'A' THEN conversion_rate END) AS conversion_rate_A,

    MAX(CASE WHEN "group" = 'B' THEN total_users END) AS users_B,
    MAX(CASE WHEN "group" = 'B' THEN total_conversions END) AS conversions_B,
    MAX(CASE WHEN "group" = 'B' THEN conversion_rate END) AS conversion_rate_B

FROM (
    SELECT
        "group",
        COUNT(*) AS total_users,
        SUM(converted) AS total_conversions,
        1.0 * SUM(converted) / COUNT(*) AS conversion_rate
    FROM ab_test_data
    GROUP BY "group"
) t;


-- Calculate Absolute and Relative Lift

WITH summary AS (
    SELECT
        "group",
        COUNT(*) AS total_users,
        SUM(converted) AS total_conversions,
        1.0 * SUM(converted) / COUNT(*) AS conversion_rate
    FROM ab_test_data
    GROUP BY "group"
),
pivoted AS (
    SELECT
        MAX(CASE WHEN "group" = 'A' THEN conversion_rate END) AS rate_A,
        MAX(CASE WHEN "group" = 'B' THEN conversion_rate END) AS rate_B
    FROM summary
)

SELECT
    rate_A,
    rate_B,
    rate_B - rate_A AS absolute_lift,
    ROUND(100.0 * (rate_B - rate_A) / rate_A, 2) AS relative_lift_pct
FROM pivoted;
