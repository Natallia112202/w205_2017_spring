drop table ove_rating_patient_surv;
create table ove_rating_patient_surv as
select
hospital_name,
patient_experience_national_comp,
cast(hospital_overall_rating as decimal(1,0)) rating
from hospitals
where patient_experience_national_comp not like 'Not%'
and hospital_overall_rating not like 'Not%'
order by rating DESC;


drop table ove_rating_patient_surv;
create table ove_rating_patient_surv as 
select
hospital_name,
patient_experience_national_comp,
cast(hospital_overall_rating as decimal(1,0)) rating
from hospitals
where patient_experience_national_comp not like 'Not%'
and hospital_overall_rating not like 'Not%'
order by rating ASC;

