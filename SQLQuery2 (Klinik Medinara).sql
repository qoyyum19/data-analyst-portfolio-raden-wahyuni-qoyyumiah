-- Medinara Clinic
-- Data Analyst with basic SQL by Raden Wahyuni Qoyyumiah

-- Checking & Identification Data
SELECT * 
FROM dbo.appointments;

SELECT *
FROM dbo.diagnoses;

SELECT *
FROM dbo.diagnoses
WHERE notes IS NULL;

SELECT *
FROM dbo.doctors;

SELECT DISTINCT specialization
FROM dbo.doctors;

SELECT DISTINCT name
FROM dbo.doctors;

SELECT * 
FROM dbo.patients;

SELECT DISTINCT patient_id
FROM dbo.patients;

SELECT *
FROM dbo.patients
WHERE phone IS NULL;

SELECT *
FROM dbo.patients
WHERE blood_type IS NULL;

SELECT *
FROM dbo.prescriptions;

SELECT DISTINCT rx_id
FROM dbo.prescriptions;

SELECT DISTINCT medicine_name
FROM dbo.prescriptions;

-- Data Overview
SELECT
COUNT(*) AS total_appointments
FROM dbo.appointments;

SELECT 
COUNT(*) AS total_diagnoses
FROM dbo.diagnoses;

SELECT
COUNT(*) AS total_doctors
FROM dbo.doctors;

SELECT
COUNT(*) AS total_patients
FROM dbo.patients;

SELECT
COUNT(*) AS total_prescriptions
FROM dbo.prescriptions;

-- Analysis
-- 1. Total Patient & Distribution patient by gender
SELECT 
COUNT(*) AS total_patients
FROM dbo.patients;

SELECT
gender,
COUNT(*) AS total_patients
FROM dbo.patients
GROUP BY gender
ORDER BY total_patients DESC;

-- 2. Average age patient
SELECT
    AVG(DATEDIFF(YEAR, dob, GETDATE())) AS average_age
FROM dbo.patients;

-- 3. Total appointment by status
SELECT
COUNT(*) AS total_appointment
FROM dbo.appointments;

SELECT
status,
COUNT(*) AS total_appoinments
FROM dbo.appointments
GROUP BY status
ORDER BY total_appoinments DESC;

-- 4. Cancellation rate
SELECT
    COUNT(CASE WHEN status = 'cancelled' THEN 1 END) * 100.0
        / COUNT(*) AS cancellation_rate
FROM appointments;

-- 5. Top 5 doctor
SELECT TOP 5
    d.doctor_id,
    d.name,
    COUNT(a.appt_id) AS total_appointments
FROM dbo.doctors d
JOIN dbo.appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY
    d.doctor_id,
    d.name
ORDER BY total_appointments DESC;

-- 6. Top 10 diagnoses
SELECT *
FROM dbo.diagnoses;

SELECT DISTINCT description
FROM dbo.diagnoses;

SELECT TOP 10
description, 
COUNT(*) AS total_cases
FROM dbo.diagnoses
GROUP BY description
ORDER BY total_cases DESC;

-- 7. Top 10 medicine & the most medicine
SELECT *
FROM dbo.prescriptions;

SELECT
    medicine_name,
    COUNT(*) AS prescription_count
FROM dbo.prescriptions
GROUP BY medicine_name
ORDER BY prescription_count DESC;

SELECT TOP 10
medicine_name, 
COUNT(*) AS total_medicine
FROM dbo.prescriptions
GROUP BY medicine_name
ORDER BY total_medicine DESC;