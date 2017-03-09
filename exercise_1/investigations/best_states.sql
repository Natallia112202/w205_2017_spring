elect state,cast(avg(hospital_overall_rating) as decimal(5,2)) ave_h from hosp_states group by state order by ave_h DESC;

