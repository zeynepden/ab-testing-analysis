-- A/B Test Summary by Group
SELECT
    group_name,
    COUNT(*) AS total_users,
    SUM(converted) AS total_conversions,
    ROUND(100.0 * SUM(converted) / COUNT(*), 2) AS conversion_rate_pct
FROM ab_test_results
GROUP BY group_name;


-- A/B Test Comparison
SELECT
    MAX(CASE WHEN group_name = 'A' THEN total_users END) AS users_a,
    MAX(CASE WHEN group_name = 'A' THEN total_conversions END) AS conversions_a,
    MAX(CASE WHEN group_name = 'A' THEN conversion_rate END) AS conversion_rate_a,
    MAX(CASE WHEN group_name = 'B' THEN total_users END) AS users_b,
    MAX(CASE WHEN group_name = 'B' THEN total_conversions END) AS conversions_b,
    MAX(CASE WHEN group_name = 'B' THEN conversion_rate END) AS conversion_rate_b
FROM (
    SELECT
        group_name,
        COUNT(*) AS total_users,
        SUM(converted) AS total_conversions,
        1.0 * SUM(converted) / COUNT(*) AS conversion_rate
    FROM ab_test_results
    GROUP BY group_name
) t;


-- Absolute and Relative Lift
WITH summary AS (
    SELECT
        group_name,
        COUNT(*) AS total_users,
        SUM(converted) AS total_conversions,
        1.0 * SUM(converted) / COUNT(*) AS conversion_rate
    FROM ab_test_results
    GROUP BY group_name
),
pivoted AS (
    SELECT
        MAX(CASE WHEN group_name = 'A' THEN conversion_rate END) AS rate_a,
        MAX(CASE WHEN group_name = 'B' THEN conversion_rate END) AS rate_b
    FROM summary
)
SELECT
    rate_a,
    rate_b,
    rate_b - rate_a AS absolute_lift,
    ROUND(100.0 * (rate_b - rate_a) / rate_a, 2) AS relative_lift_pct
FROM pivoted;
