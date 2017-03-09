drop table hosp_states;
create table hosp_states as
select
hospital_overall_rating,
state
from hospitals
where hospital_overall_rating not like "Not%"
order by hospital_overall_rating DESC;


