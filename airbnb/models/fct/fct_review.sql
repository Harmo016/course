{{
config(
    materialized='incremental',
    on_schema_change='fail'
)
}}

WITH src_reviews AS (
    SELECT * FROM {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
WHERE REVIEWER_COMMENTS is not null
{% if is_incremental() %}
AND REVIEW_DATE > (SELECT max(REVIEW_DATE) FROM {{  this  }} )
{% endif %}