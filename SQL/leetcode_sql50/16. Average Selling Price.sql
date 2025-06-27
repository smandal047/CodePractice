# Write your MySQL query statement below
with cte as (
    select pr.product_id, units, units * price as total_price
    from unitssold so
    right join prices pr
    on so.product_id = pr.product_id
    and purchase_date between start_date and end_date
)

-- select * from cte

select product_id, ifnull(round(sum(total_price) / sum(units),2),0) average_price
from cte
group by 1


-- simplified a bit
select pr.product_id, ifnull(round(sum(units * price) / sum(units),2),0) average_price
from unitssold so
right join prices pr
on so.product_id = pr.product_id
and purchase_date between start_date and end_date
group by 1