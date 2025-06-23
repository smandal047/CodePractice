--MySQL
with cte as (
    select machine_id, count(process_id) / 2 cnt,
        sum(case when activity_type = 'start' then timestamp else 0.000 end) as start,
        sum(case when activity_type = 'end' then timestamp else 0.000 end) as end
    from Activity
    group by 1
)

select machine_id, round((end - start)/cnt, 3) as processing_time from cte;

-- see here are grouping activity type hence u have unique machine_id, process_id
with cte as (
    select machine_id, process_id,
        sum(case when activity_type = 'end' then timestamp else 0.000 end) - 
        sum(case when activity_type = 'start' then timestamp else 0.000 end) as duration
    from Activity
    group by 1,2
)

-- select * from cte
select machine_id, round(avg(duration), 3) as processing_time from cte
group by 1

-- slow appoach but good to know
select machine_id, round(avg(a.timestamp - b.timestamp), 3) as processing_time 
from activity a
join activity b using(machine_id, process_id)
where a.activity_type = 'end' and b.activity_type = 'start'
group by 1
