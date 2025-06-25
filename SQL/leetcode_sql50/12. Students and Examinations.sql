
with cte_stu as (
    select student_id, student_name, subject_name
    from students cross join subjects
)

select student_id, student_name, subject_name, count(exa.subject_name) attended_exams from cte_stu
left join examinations exa using(student_id, subject_name)

group by 1,2,3
order by 1,3


-- better method
select stu.student_id, stu.student_name, sub.subject_name, count(exa.subject_name) attended_exams 
from students stu cross join subjects sub
left join examinations exa
on stu.student_id = exa.student_id
and sub.subject_name = exa.subject_name

group by 1,2,3
order by 1,3