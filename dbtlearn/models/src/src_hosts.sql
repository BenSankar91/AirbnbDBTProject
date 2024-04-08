
with hosts as 
(
select * from {{ source('airbnb', 'hosts') }}
)
select id as host_id,
name as host_name,
case when is_superhost='t' then true else false end as is_superhost,
created_at,
updated_at
from hosts