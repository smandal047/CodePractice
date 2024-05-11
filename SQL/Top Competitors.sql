select 
    f2.hacker_id, 
    f2.name
from (
    select 
        f1.hacker_id, 
        f1.name,
        count( f1.hacker_id) ct

    from (

        select 
            h.hacker_id hacker_id,
            h.name name,
            s.score obt_score,
            d.score max_score,
            difficulty_level
        from submissions s
        left join hackers h using (hacker_id)
        left join challenges c using (challenge_id)
        left join difficulty d using (difficulty_level)

        where s.score = d.score
    ) f1
    group by 1,2

    having count( f1.hacker_id) > 1
) f2
order by ct desc,  f2.hacker_id