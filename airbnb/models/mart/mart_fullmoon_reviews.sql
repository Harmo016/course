{{
config(
materialized = 'table'
)
}}

WITH fct_review AS (
    SELECT * FROM {{ ref('fct_review') }}
),
full_moondates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)

SELECT 
    fct_rews.*,
    CASE WHEN
        moon_dts.FULL_MOON_DATE IS NULL THEN 'NOT FULL MOON'
    ELSE
        'FULL MOON'
    END AS IS_FULL_MOON
     FROM fct_review as fct_rews
LEFT JOIN full_moondates as moon_dts on 
    DATEADD(DAY,1,moon_dts.FULL_MOON_DATE) = fct_rews.REVIEW_DATE 