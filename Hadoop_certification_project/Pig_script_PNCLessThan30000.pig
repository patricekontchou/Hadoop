--This script is written by Patrice Kontchou on May 2016 and can be copied and full use without contacting me. 

--Register the UDF from piggybank in order to load CSV data

--Load Plan Info County  where id is less than 3000

Register 'hdfs://ip-10-0-0-28.ec2.internal:8020/user/hduser/pat_hdfs/piggybank-0.12.0.jar'
D =LOAD 'hdfs://ip-10-0-0-28.ec2.internal:8020/user/hduser/pat_hdfs/PlanInfoCounty_FipsCodeLessThan30000.csv' using org.apache.pig.piggybank.storage.CSVExcelStorage();

PICSelect2 = FOREACH D GENERATE $0 AS contract_ID, $1 AS plan_ID,$2 AS segment_id,$3 AS contract_year,$4 AS org_name,$5 AS plan_name,$38 as zip_code,$74 AS county_fips_code;

STORE PICSelect2 INTO 'hdfs://ip-10-0-0-28.ec2.internal:8020/user/hduser/pat_hdfs/PlanInfoCounty1';
