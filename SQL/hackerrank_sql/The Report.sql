select 
    case 
        when g.grade < 8 then Null
        else s.name
    end as name, 
    g.grade, 
    s.marks 
from students s
inner join grades g
    on s.marks between g.min_mark and g.max_mark

order by 2 desc, 1, 3