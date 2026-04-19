-- =========================================
-- Healthcare Data Analytics Project
-- Tool: Google BigQuery
-- =========================================

-- =========================================
-- 1. Admission by Medical Condition
-- =========================================
select
  medical_condition,
  admission_type,
  count(name) as total_admissions,
  count(name) * 100.0 / sum(count(name)) over () as percentage
from
  h1.Healthcare.health_data
group by 
  medical_condition, admission_type
order by
  total_admissions DESC;

-- =========================================
-- 2. Year wise Medical Record
-- =========================================
select 
    medical_condition,
    extract(year from discharge_date) AS year,
    count(name) as patient_record 
from 
    h1.Healthcare.health_data
group by 
    medical_condition,year
order by 
    medical_condition,year ASC

-- =========================================
-- 3. Blood Type Analysis 
-- =========================================
select 
    blood_type,
    gender,
    count(name) as Patient_Record 
from 
    h1.Healthcare.health_data
group by 
    blood_type,gender
order by 
    blood_type 
    
-- =========================================
-- 4. Yearly cost Analysis
-- =========================================
select
  medical_condition,
  extract(YEAR FROM discharge_date) as year,
  extract(QUARTER FROM discharge_date) as quarter,
  round(sum(billing_amount) / 1000000, 2) as total_cost
from
    h1.Healthcare.health_data
group by
  medical_condition,
  year,
  quarter
order by
  year ASC,
  quarter ASC;  

-- =========================================
-- 5. Age wise Cost Analysis
-- =========================================
select 
    age,
    ROUND(SUM(billing_amount) / 1000000, 2) AS total_cost,
from 
    h1.Healthcare.health_data
group by age
order by age ASC

-- =========================================
-- 6. Top 10 Busy Hospital
-- =========================================
select 
    hospital,
    count(name) as patient_record,
    ROUND(SUM(billing_amount) / 1000000, 2) AS total_cost,
from 
    h1.Healthcare.health_data
group by hospital
order by patient_record desc
Limit 10

-- =========================================
-- 7. Top 10 Doctors
-- =========================================
select 
    doctor,
    count(name) as patient_record 
from 
    h1.Healthcare.health_data
group by doctor
order by patient_record desc
Limit 10

-- =========================================
-- 8. Insurance Provider
-- =========================================
select 
    insurance_provider,
    count(name) as patient_record 
from 
    h1.Healthcare.health_data
group by insurance_provider
order by patient_record desc

-- =========================================
-- 9. Top 20 Hospital vs Insurance Provider
-- =========================================
select 
    hospital, 
    insurance_provider,
    count(name) as patient_record 
from 
    h1.Healthcare.health_data
group by hospital,insurance_provider
order by patient_record desc
Limit 20

-- =========================================
-- 10. Medication vs Test Results
-- =========================================
select 
    medication,
    test_results,
    count(name) as Patient_Record 
from 
    h1.Healthcare.health_data
group by medication,test_results
order by Patient_Record ASC

