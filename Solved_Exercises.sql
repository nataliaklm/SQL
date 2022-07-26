--Show first name and last name of patients who does not have allergies (null)
SELECT first_name, last_name FROM patients
WHERE allergies is null;
--Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
SELECT first_name, last_name FROM patients
WHERE weight between 100 and 120;
--Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
UPDATE patients
SET allergies = 'NKA'
WHERE allergies is null;
--Show all the columns from admissions where the patient was admitted and discharged on the same day
SELECT * from admissions
WHERE admission_date=discharge_date;
--Show unique first names from the patients table which only occurs once in the list
SELECT distinct first_name from patients
GROUP BY first_name
HAVING COUNT (*) = 1;
--Show patient_id, first_name, last_name from the patients table.Order the rows by the first_name ascending and then by the last_name descending
SELECT patient_id, first_name, last_name
FROM patients
ORDER BY first_name, last_name desc
--Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date
SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date like "197%"
ORDER BY birth_date
--Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
SELECT (MAX(weight) - MIN(weight)) AS weight_diff
FROM patients
WHERE last_name='Maroni'
--Show first name, last name and role of every person that is either patient or physician.The roles are either "Patient" or "Physician"
SELECT first_name, last_name, "Patient" AS "Role" FROM patients
UNION
SELECT first_name, last_name, "Physician" FROM physicians
/*Show patient_id, attending_physician_id, and primary_diagnosis for admissions that match one of the two criteria:
1. patient_id is an odd number and attending_physician_id is either 1, 5, or 19.
2. attending_physician_id contains a 2 and the length of patient_id is 3 characters.*/
SELECT patient_id, attending_physician_id, primary_diagnosis
FROM admissions
WHERE mod(patient_id,2) <> 0 AND attending_physician_id IN (1,5,19)
OR
attending_physician_id LIKE '%2%' AND LEN(patient_id)=3

