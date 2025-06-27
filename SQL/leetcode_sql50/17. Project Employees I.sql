# Write your MySQL query statement below

select pr.project_id, round(avg(experience_years),2) average_years
from project pr
left join employee emp using (employee_id)

group by 1