with source as (
    select * 
    from {{source('blushmetrics_raw', 'raw_google_trends')}}
), 

renamed as (
    select
        parse_date('%Y-%m-%d', date) as week_start,
        `Rare Beauty` as rare_beauty,
        Rhode as rhode,
        Sacheu as sacheu,
        Youthforia as youthforia,
        `Drunk Elephant` as drunk_elephant,
        `Fenty Beauty` as fenty_beauty,
        `Beauty of Joseon` as beauty_of_joseon
    from source
)

select * from renamed