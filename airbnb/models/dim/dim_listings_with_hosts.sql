WITH dim_hosts_cleansed AS (
SELECT * FROM {{ ref('dim_hosts_cleansed') }}
),
dim_listings_cleansed AS (
SELECT * FROM {{ ref('dim_listings_cleansed') }}
)

SELECT
    hosts.host_id,
    hosts.host_name,
    hosts.is_superhost as host_is_superhost,
    listings.created_at,
    GREATEST(hosts.updated_at, listings.updated_at) as updated_at
FROM dim_hosts_cleansed AS hosts
LEFT JOIN dim_listings_cleansed listings
ON hosts.host_id=listings.host_id