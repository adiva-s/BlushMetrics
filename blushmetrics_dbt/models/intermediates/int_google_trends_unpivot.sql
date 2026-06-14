with source_data as (
    select * from {{ ref('stg_brand_trends') }}

)

select 
    week_start,
    brand,
    search_interest
from source_data

unpivot(
    search_interest 
    for brand in (
        rare_beauty,
        rhode,
        sacheu,
        youthforia,
        drunk_elephant,
        fenty_beauty,
        beauty_of_joseon
    )
)