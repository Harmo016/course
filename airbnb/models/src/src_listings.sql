WITH raw_listing AS (
    SELECT * FROM {{  source('airbnb','listings') }}
)
SELECT 
    ID as LISTING_ID,
    NAME AS LISTING_NAME,
    LISTING_URL,
    ROOM_TYPE,
    MINIMUM_NIGHTS,
    HOST_ID,
    PRICE AS PRICE_STR,
    CREATED_AT,
    UPDATED_AT
FROM
    raw_listing 
