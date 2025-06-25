select user_id,
round( sum( case when action = 'confirmed' then 1 else 0 end ) / count(1), 2) as confirmation_rate

from Signups
left join Confirmations using(user_id)
group by 1