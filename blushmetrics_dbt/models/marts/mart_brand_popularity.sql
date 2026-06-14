with brand_popularity as (

    select
        brand,
        round(avg(search_interest), 2) as avg_search_interest
    from {{ ref('int_google_trends_unpivot') }}
    group by brand

)

select
    brand,
    avg_search_interest,

    rank() over (
        order by avg_search_interest desc
    ) as popularity_rank

from brand_popularity

order by popularity_rank