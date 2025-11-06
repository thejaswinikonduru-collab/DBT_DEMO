with CTE as(
SELECT
to_timestamp(STARTED_AT) as STARTED_AT,
date(to_timestamp(STARTED_AT)) as date_started_at,
hour(to_timestamp(STARTED_AT)) as hour_started_at,

    {{day_type('STARTED_AT')}} as day_type,

    {{get_season('STARTED_AT')}} as station_year
        

    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at')


select * from CTE