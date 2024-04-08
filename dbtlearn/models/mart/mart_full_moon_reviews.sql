{{
  config(
    materialized = 'table',
    )
}}
with fd as (
    select * from {{ ref('seed_full_moon_dates') }}
),
r as (
    select * from {{ ref('fact_reviews') }}
)
select r.*,
case when fd.full_moon_date is not null then 'full moon'
else 'not full moon'
end as is_full_moon
from r left join fd on r.review_date=dateadd(day,1,fd.full_moon_date)