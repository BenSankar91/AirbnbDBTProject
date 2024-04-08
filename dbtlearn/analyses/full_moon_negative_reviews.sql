with fmd as (
    select * from {{ ref('mart_full_moon_reviews') }}
)
select is_full_moon,
    review_sentiment,
    count(is_full_moon) as num_reviews
from fmd
group by 
    1,2
order by 
    1,2