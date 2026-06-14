-- Q: Which brands are growing or declining in popularity over time?
-- Did the brands maintain their momentum from the previous year?
-- Did popularity transfer into the next period?

with periods as (
    select
        week_Start,
        brand, 
        search_interest,

        case 
            when extract(year from week_start) = 2025 then 'H2_2025'
            when extract(year from week_start) = 2026 then 'H1_2026'
        end as period
    from {{ ref('int_google_trends_unpivot') }}

), 

brand_averages as (
    select
        brand,          
        period,
        round(avg(search_interest), 2) as avg_search_interest
    from periods
    group by brand, period
), 

momentum_average as(
    select
        brand,

        max(
            case
                when period = 'H2_2025'
                then avg_search_interest
            end
        ) as h2_2025_avg,

        max(
            case
                when period = 'H1_2026'
                then avg_search_interest
            end
        ) as h1_2026_avg

    from brand_averages
    group by brand
)

select
    brand,

    round(h2_2025_avg, 2) as h2_2025_avg,
    round(h1_2026_avg, 2) as h1_2026_avg,

    round(
        ((h1_2026_avg - h2_2025_avg)
        / h2_2025_avg) * 100,
        2
    ) as pct_change,

    case
        when ((h1_2026_avg - h2_2025_avg)
              / h2_2025_avg) * 100 > 10
            then 'Gaining Momentum'

        when ((h1_2026_avg - h2_2025_avg)
              / h2_2025_avg) * 100 < -10
            then 'Losing Momentum'

        else 'Maintaining Momentum'
    end as momentum_status

from momentum_average