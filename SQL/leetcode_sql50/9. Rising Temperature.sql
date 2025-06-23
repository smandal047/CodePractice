with cte as (
    select id, recordDate, temperature currTemp, 
    lag(temperature, 1) over(order by recordDate) prevTemp,
    lag(recordDate, 1) over(order by recordDate) prevDate
    from weather
)
select id from cte
where currTemp > prevTemp and datediff(recordDate, prevDate) = 1