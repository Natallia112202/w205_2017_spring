#!/bin/bash
# save my current directory
MY_CWD=$(pwd)

# clean/remove staging directory with files
rm ~/staging/exercise_1/*

# remove directories
rmdir ~/staging/exercise_1
rmdir ~/staging

# Remove files and directories from HDFS
hdfs dfs -rm /user/w205/hospital_compare/hospitals/hospitals.csv
hdfs dfs -rm /user/w205/hospital_compare/care/care.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions/readmissions.csv
hdfs dfs -rm /user/w205/hospital_compare/measure/measure.csv
hdfs dfs -rm /user/w205/hospital_compare/scores/scores.csv

# remove directories/subdirectories hospital_compare from HDFS
hdfs dfs -rmdir /user/w205/hospital_compare/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare/care
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions
hdfs dfs -rmdir /user/w205/hospital_compare/measure
hdfs dfs -rmdir /user/w205/hospital_compare/scores

hdfs dfs -rmdir /user/w205/hospital_compare


# change directory back to current working directory
cd $MY_CWD

# clean exit
exit


