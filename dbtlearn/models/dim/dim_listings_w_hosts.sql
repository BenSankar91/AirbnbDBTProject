{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}
with l as (   
    select * from {{ ref('dim_listings_cleansed') }}
),
h as (
    select * from {{ ref('dim_hosts_cleansed') }}
)
select l.listing_id,
l.listing_name,
l.room_type,
l.minimum_nights,
l.price,
l.host_id,
h.host_name,
h.is_superhost,
l.created_at,
GREATEST(l.updated_at, h.updated_at) as updated_at
from l join h on l.host_id=h.host_id
{% if is_incremental() %}
where l.created_at > (select max(created_at) from {{ this }})
{% endif %}
