/*
Working platform:- MySQL
In Sql think trees as array and iter over each values
*/

select 
    n,
    case
        when p is null then 'Root'
        when (select count(p) from BST where tree.n = p ) < 1 then 'Leaf'
        else 'Inner'
    end as n_type
from BST as tree
order by n