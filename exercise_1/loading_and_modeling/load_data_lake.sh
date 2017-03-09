#!/bin/bash
# saving current directory
MY_CWD=$(pwd)

#creating staging directory/start from home directory (~)
mkdir ~/staging
mkdir ~/staging/exercise_1

# changing to staging directory
cd ~/staging/exercise_1

# getting the file from medicare website(data.medicare.gov),naming the zip file
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip

# unzipping the file medicare_data.zip
unzip medicare_data.zip

# removing first line(row) in files and renaming files

# first file
MY_FILE1="Hospital General Information.csv"
tail -n +2 "$MY_FILE1" >hospitals.csv

# creating directory <hospital_compare> on HDFS 
hdfs dfs -mkdir /user/w205/hospital_compare

# putting the file (hospitals.csv) into <hospital_compare/hospitals>  directory 
M_FILE1="hospitals"
hdfs dfs -mkdir /user/w205/hospital_compare/$M_FILE1
hdfs dfs -put ${M_FILE1}.csv /user/w205/hospital_compare/$M_FILE1

# second file
MY_FILE2="Timely and Effective Care - Hospital.csv" 
tail -n +2 "$MY_FILE2" >care.csv

# putting the file (care.csv) into <hospital_compare/care>  directory 
M_FILE2="care"
hdfs dfs -mkdir /user/w205/hospital_compare/$M_FILE2
hdfs dfs -put ${M_FILE2}.csv /user/w205/hospital_compare/$M_FILE2

# third file
MY_FILE3="Readmissions and Deaths - Hospital.csv"
tail -n +2 "$MY_FILE3" >readmissions.csv

# putting the file (readmissions.csv) into <hospital_compare/readmissions>  directory 
M_FILE3="readmissions"
hdfs dfs -mkdir /user/w205/hospital_compare/$M_FILE3
hdfs dfs -put ${M_FILE3}.csv /user/w205/hospital_compare/$M_FILE3

# fourth file
MY_FILE4="Measure Dates.csv"
tail -n +2 "$MY_FILE4" >measure.csv

# putting the file (measure.csv) into <hospital_compare/measure>  directory 
M_FILE4="measure"
hdfs dfs -mkdir /user/w205/hospital_compare/$M_FILE4
hdfs dfs -put ${M_FILE4}.csv /user/w205/hospital_compare/$M_FILE4

# fifth file
MY_FILE5="hvbp_hcahps_11_10_2016.csv"
tail -n +2 "$MY_FILE5" >scores.csv

# putting the file (scores.csv) into <hospital_compare/scores>  directory 
M_FILE5="scores"
hdfs dfs -mkdir /user/w205/hospital_compare/$M_FILE5
hdfs dfs -put ${M_FILE5}.csv /user/w205/hospital_compare/$M_FILE5

# Change directory to original CWD
cd $MY_CWD
# perform exit
exit

