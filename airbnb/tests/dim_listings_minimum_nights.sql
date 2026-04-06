-- The test fails if the query return results.
-- The test passes if the query returns empty (no result).
-- optinally, add a limit to not overflow the test result table.

SELECT * FROM {{ ref('dim_listings_cleansed') }} WHERE MINIMUM_NIGHTS < 1 LIMIT 10