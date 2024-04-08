select f.listing_id from {{ ref('fact_reviews') }} f 
join {{ ref('dim_listings_w_hosts') }} l on l.listing_id=f.listing_id
where f.review_date < l.created_at