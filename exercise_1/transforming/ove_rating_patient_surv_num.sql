
drop table ove_rating_patient_surv_num;
create table ove_rating_patient_surv_num as
select
hospital_name,
case patient_experience_national_comp
when 'Below the National average' then 1
when 'Same as the National average' THEN 2
when 'Above the National average' THEN 3
else 0
END as patient_experience_national_comp,
cast (hospital_overall_rating as decimal(1,0)) rating
from hospitals
where patient_experience_national_comp not like 'Not%'
and hospital_overall_rating not like 'Not%'
order by rating ASC;
