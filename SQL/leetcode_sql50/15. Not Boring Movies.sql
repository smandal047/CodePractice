select id, movie, description, rating
from Cinema

where 1=1
and id % 2 <> 0 
and not lower(description) like "%boring%"

order by rating desc