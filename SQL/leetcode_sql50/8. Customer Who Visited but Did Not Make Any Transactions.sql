select customer_id, count(1) count_no_trans from visits v
left join transactions t using(visit_id)
where transaction_id is null
group by customer_id
order by count_no_trans