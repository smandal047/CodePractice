set @ct:=0;

select min(f1.start_date), max(f1.end_date)  from (
    select
        start_date,
        end_date,
        case
            when (select count(*) from projects p0 where p1.start_date = p0.end_date) = 0 then (@ct:=@ct+1)
            else @ct
        end as ct

    from (select * from projects order by start_date) p1
) f1

group by f1.ct
order by  max(f1.end_date) - min(f1.start_date)