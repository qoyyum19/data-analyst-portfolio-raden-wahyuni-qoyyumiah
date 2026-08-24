-- SkillAju
-- Data Analyst with basic SQL by Raden Wahyuni Qoyyumiah

-- Checking & Identification Data
SELECT *
FROM dbo.courses;

SELECT DISTINCT category
FROM dbo.courses;

SELECT DISTINCT level
FROM dbo.courses;

SELECT *
FROM dbo.enrollments;

SELECT *
FROM dbo.enrollments
WHERE completion_date IS NULL;

SELECT *
FROM dbo.instructors;

SELECT *
FROM dbo.instructors
WHERE city = 'Jakarta';

SELECT DISTINCT expertise
FROM dbo.instructors;

SELECT *
FROM dbo.quiz_results;

SELECT *
FROM dbo.students;

SELECT *
FROM dbo.students
WHERE plan_type = 'pro';

-- Overview Data
SELECT 
COUNT(*) AS total_courses
FROM dbo.courses;

SELECT
COUNT(*) AS total_enrollments
FROM dbo.enrollments;

SELECT
COUNT(*) AS total_instructors
FROM dbo.instructors;

SELECT
COUNT(*) AS total_quiz_results
FROM dbo.quiz_results;

SELECT
COUNT(*) AS total_students
FROM dbo.students;


-- Analysis
-- 1. Total students & Student by age
SELECT 
COUNT(DISTINCT student_id) AS total_students
FROM dbo.students;

SELECT *
FROM dbo.students;

SELECT age, COUNT(*) AS total_students
FROM dbo.students
WHERE age <= 25
GROUP BY age
ORDER BY total_students DESC;

SELECT age, COUNT(*) AS total_students
FROM dbo.students
WHERE age >= 26
GROUP BY age
ORDER BY total_students DESC;

-- 2. Total course by category
SELECT
category,
COUNT(*) total_course
FROM dbo.courses
GROUP BY category
ORDER BY total_course;

-- 3. The most Course Enrollment
SELECT *
FROM dbo.courses;

SELECT *
FROM dbo.enrollments;

SELECT TOP 10
    c.course_id,
    c.title,
    COUNT(e.student_id) AS total_enrollments
FROM dbo.courses c
LEFT JOIN dbo.enrollments e
    ON c.course_id = e.course_id
GROUP BY 
    c.course_id,
    c.title
ORDER BY total_enrollments DESC

-- 4. Total course by each instructor
SELECT *
FROM dbo.instructors;

SELECT *
FROM dbo.courses;

SELECT 
    i.instructor_id,
    i.name,
    COUNT(c.course_id) AS total_courses
FROM dbo.instructors i
LEFT JOIN dbo.courses c
    ON i.instructor_id = c.instructor_id
GROUP BY 
    i.instructor_id,
    i.name
ORDER BY total_courses DESC;

-- 5. Student with the most course
SELECT *
FROM dbo.students;

SELECT *
FROM dbo.enrollments;

SELECT TOP 10
    s.student_id,
    s.name,
    COUNT(e.course_id) AS total_courses
FROM dbo.students s
JOIN dbo.enrollments e
    ON s.student_id = e.student_id
GROUP BY 
    s.student_id,
    s.name
ORDER BY total_courses DESC;