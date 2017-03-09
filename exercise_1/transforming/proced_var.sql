drop table proced_var;
create table proced_var as
select
measure_name,
cast(score as decimal(5,2)) rating
from readmissions
where score not like 'Not%'
order by rating DESC;

