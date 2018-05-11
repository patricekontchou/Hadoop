--This script is written by Patrice Kontchou on May 2016 and can be copied and full use without contacting me.  

--Register the UDF from piggybank in order to load CSV data
Register 'hdfs://ip-10-0-0-28.ec2.internal:8020/user/hduser/pat_hdfs/piggybank-0.12.0.jar'

--Load and,transform PlanServices.csv File

PlanServices =LOAD 'hdfs://ip-10-0-0-28.ec2.internal:8020/user/hduser/pat_hdfs/vwPlanServices.csv' using org.apache.pig.piggybank.storage.CSVExcelStorage() AS (Language:chararray,contact_Year:chararray,contract_id:chararray,plan_ID:chararray,category_description:chararray,
category_code:chararray,benefit:chararray,package_name:chararray,package_id:chararray,sentences_sort_order:chararray);

 PlanServicesFiltered = FILTER PlanServices BY Language == 'English';

STORE PlanServicesFiltered INTO 'hdfs://ip-10-0-0-28.ec2.internal:8020/user/hduser/pat_hdfs/PlanServices_New'
