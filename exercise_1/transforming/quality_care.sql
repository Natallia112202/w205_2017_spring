drop table quality_care;
create table quality_care as
select
state,
hospital_name,
score,
count(score) as log_c
from care
where score not like 'Not%'
and score like 'Very%'
group by hospital_name,score,state
order by log_c DESC;

drop table quality_care_national_comp;
create table quality_care_national_comp as 
select
provider_id,
hospital_name,
state,
mortality_national_comp,
safety_of_care_national_comp,
readmission_national_comp,
patient_experience_national_comp,
eff_of_care_national_cpmp
from hospitals
where mortality_national_comp  not like 'Not%'
and (mortality_national_comp = 'Above the National average' OR mortality_national_comp = 'Same as the National average')  
and safety_of_care_national_comp  not like 'Not%'
and (safety_of_care_national_comp = 'Above the National average' OR safety_of_care_national_comp = 'Same as the National average')
and readmission_national_comp not like 'Not%'
and (readmission_national_comp = 'Above the National average' OR readmission_national_comp = 'Same as the National average')
and patient_experience_national_comp not like 'Not%'
and (patient_experience_national_comp = 'Above the National average' OR patient_experience_national_comp = 'Same as the National average')
and eff_of_care_national_cpmp not like 'Not%'
and (eff_of_care_national_cpmp = 'Above the National average' OR eff_of_care_national_cpmp = 'Same as the National average')
order by mortality_national_comp ASC, safety_of_care_national_comp ASC,readmission_national_comp ASC,patient_experience_national_comp ASC,eff_of_care_national_cpmp ASC;

