WITH listings AS (
    SELECT listing_id, created_at FROM {{ ref('dim_listings_cleansed') }}
),
fct_reviews AS (
    SELECT listing_id, review_date FROM {{ ref('fct_review') }}
)

SELECT 
    fct_reviews.review_date,
    listings.created_at
FROM 
    fct_reviews
    INNER JOIN listings 
    ON fct_reviews.listing_id =  listings.listing_id
WHERE listings.created_at > fct_reviews.review_date  
LIMIT 10