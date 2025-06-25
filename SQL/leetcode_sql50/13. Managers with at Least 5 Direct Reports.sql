select e2.name
from employee e1
left join employee e2
on e1.managerId = e2.id
where e2.id is not null
group by e1.managerId
having count(1) >= 5