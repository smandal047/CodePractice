/*
Working platform:- MySQL
Notice the spaces in the string
*/
select 
    concat(name, "(", substring(occupation,1,1), ")") 
from OCCUPATIONS 
group by name,occupation 
order by name;

select 
    concat("There are a total of ", count(occupation), " ", lower(occupation), "s.") 
from OCCUPATIONS 
group by occupation 
order by  count(occupation), occupation;