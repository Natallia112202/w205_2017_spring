DROP TABLE hospitals;

CREATE EXTERNAL TABLE hospitals
(
 provider_id string,
 hospital_name string,
 address string,
 city string,
 state string,
 zip_code string,
 county_name string,
 phone_number string,
 hospital_type string,
 hospital_ownership string,
 emergency_services string,
 meets_criteria_for_use_of_ehrs string,
 hospital_overall_rating string,
 hospital_overall_rating_footnote string,
 mortality_national_comp string,
 mortality_national_comp_footnote string,
 safety_of_care_national_comp string,
 safety_of_care_national_comp_footnote string,
 readmission_national_comp string,
 readmission_national_comp_footnote string,
 patient_experience_national_comp string,
 patient_experience_national_comp_footnote string,
 eff_of_care_national_cpmp string,
 eff_of_care_national_cpmp_footnote string,
 timeliness_of_care_national_comp string,
 timeliness_of_care_national_comp_footnote string,
 eff_use_of_med_imaging_national_compn string,
 eff_use_of_med_imaging_national_compn_footnote string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorCharR" = ',',
	"quoteChar" ='"',  
	"escapeCharR" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals'
;
DROP TABLE care;

CREATE EXTERNAL TABLE care
(
 provider_id string,
 hospital_name string,
 address string,
 city string,
 state string,
 zip_code string,
 county_name string,
 phone_number string,
 condition string,
 measure_id string,
 measure_name string,
 score string,
 sample string,
 footnote string,
 measure_start_date string,
 measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

WITH SERDEPROPERTIES (
	"separatorChar" = ',',
	"quoteChar" ='"',  
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/care'
;

DROP TABLE readmissions;

CREATE EXTERNAL TABLE readmissions
(
 provider_id string,
 hospital_name string,
 address string,
 city string,
 state string,
 zip_code string,
 county_name string,
 phone_number string,
 measure_name string,
 measure_id string,
 compared_to_national string,
 denominator string,
 score string,
 lower_estimate string,
 higher_estimate string,
 footnote string,
 measure_start_date string,
 measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

WITH SERDEPROPERTIES (
	"separatorChar" = ',',
	"quoteChar" ='"',  
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions'
;


DROP TABLE measure;

CREATE EXTERNAL TABLE measure
(
 measure_name string,
 measure_id string,
 measure_start_quarter string,
 measure_start_date string,
 measure_end_quarter string,
 measure_end_date string 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

WITH SERDEPROPERTIES (
	"separatorChar" = ',',
	"quoteChar" ='"',  
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measure'
;


DROP TABLE scores;

CREATE EXTERNAL TABLE scores
(
 provider_id string,
 hospital_name string,
 address string,
 city string,
 state string,
 zip_code string,
 county_name string,
 comm_with_nurses_fl string,
 comm_with_nurses_achievment_threshold string,
 comm_with_nurses_benchmark string,
 comm_with_nurses_baseline_rate string,
 comm_with_nurses_performance_rate string,
 comm_with_nurses_achievement_points string,
 comm_with_nurses_improvement_points string,
 comm_with_nurses_dimension_score string,
 
 comm_with_doctors_fl string,
 comm_with_doctors_achievment_threshold string,
 comm_with_doctors_benchmark string,
 comm_with_doctors_baseline_rate string,
 comm_with_doctors_performance_rate string,
 comm_with_doctors_achievement_points string,
 comm_with_doctors_improvement_points string,
 comm_with_doctors_dimension_score string,

 resp_of_hospital_staff_fl string,
 resp_of_hospital_staff_achievment_threshold string,
 resp_of_hospital_staff_benchmark string,
 resp_of_hospital_staff_baseline_rate string,
 resp_of_hospital_staff_performance_rate string,
 resp_of_hospital_staff_achievement_points string,
 resp_of_hospital_staff_improvement_points string, 
 resp_of_hospital_staff_dimension_score string,

 pain_management_fl string,
 pain_management_achievment_threshold string,
 pain_management_benchmark string,
 pain_management_baseline_rate string,
 pain_management_performance_rate string,
 pain_management_achievement_points string,
 pain_management_improvement_points string, 
 pain_management_dimension_score string,  
 
 comm_about_medicine_fl string,
 comm_about_medicine_achievment_threshold string,
 comm_about_medicine_benchmark string,
 comm_about_medicine_baseline_rate string,
 comm_about_medicine_performance_rate string,
 comm_about_medicine_achievement_points string,
 comm_about_medicine_improvement_points string, 
 comm_about_medicine_dimension_score string,

 clean_and_quiet_of_hosp_env_fl string, 
 clean_and_quiet_of_hosp_env_achievment_threshold string,
 clean_and_quiet_of_hosp_env_benchmark string,
 clean_and_quiet_of_hosp_env_baseline_rate string,
 clean_and_quiet_of_hosp_env_performance_rate string,
 clean_and_quiet_of_hosp_env_achievement_points string,
 clean_and_quiet_of_hosp_env_improvement_points string, 
 clean_and_quiet_of_hosp_env_dimension_score string,

 discharge_info_fl string,   
 discharge_info_achievment_threshold string,
 discharge_info_benchmark string,
 discharge_info_baseline_rate string,
 discharge_info_performance_rate string,
 discharge_info_achievement_points string,
 discharge_info_improvement_points string, 
 discharge_info_dimension_score string,

 overall_rating_of_hosp_fl string,
 overall_rating_of_hosp_achievment_threshold string,
 overall_rating_of_hosp_benchmark string,
 overall_rating_of_hosp_baseline_rate string,
 overall_rating_of_hosp_performance_rate string,
 overall_rating_of_hosp_achievement_points string,
 overall_rating_of_hosp_improvement_points string, 
 overall_rating_of_hosp_dimension_score string,
 hcahps_base_score string,
 hcahps_consistency_score string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

WITH SERDEPROPERTIES (
	"separatorChar" = ',',
	"quoteChar" ='"',  
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/scores'
;


