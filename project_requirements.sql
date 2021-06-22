USE devcamp_project;

-- COUNT OF HOW MANY GRADES PROFFESSOR GIVES OUT
-- SELECT professor_id, COUNT(professor_id)
-- FROM grades
-- GROUP BY professor_id; 

-- LIST OF ALL GRADES GIVEN BY A TEACHER AND LISTED BY TEACHER ID AND NAME
-- SELECT *
-- FROM professor
-- JOIN grades
-- ON professor_professor_id = professor_id;

-- -- SHOWS PROFESSOR ID AND AVERAGE GRADE
SELECT professor_id, AVG(grade) AS AVG_GRADE
FROM grades -- GROUP BY professor_id;
GROUP BY professor_id;


-- ANSWER TO AVERAGE GRADE PROFESSOR GIVES OUT WITH NAMES OF PROFESSORS
SELECT professor_id, AVG(grade) AS AVG_GRADE, professor_name
FROM grades
JOIN professor
ON professor_id = professor_professor_id
GROUP BY professor_id;
-- ANSWER ABOVE DO NOT DELETE

-- ANSWER TO TOP GRADE FOR EACH STUDENT
SELECT student_id, MAX(grade) as Max_Grade, student_name
FROM grades
JOIN student_table
ON student_id = student_student_id
GROUP BY student_id;
-- ANSWER ABOVE DO NOT DELETE


-- ANSWER TO GROUP STUDENTS BY COURSE ENROLLED IN 
SELECT student_name, course_name
FROM grades
JOIN student_table
on student_id = student_student_id
RIGHT JOIN courses
on course_id = course_table_id
ORDER BY course_name;
-- ANSWER ABOVE DO NOT DELETE

-- ANSWER TO CREATE A SUMMARY REPORT OF COURSES AND AVERAGE GRADES SORTED BY MOST CHALLENGING COURSE (COURSE WITH LOWEST AVERAGE) TO EASIEST COURSE
SELECT AVG(grade) AS Average_Grade, course_name
FROM grades
JOIN courses
ON course_id = course_table_id
group by course_name
order by Average_Grade ASC;
-- ANSWER ABOVE DO NOT DELETE


-- ANSWER TO FINDING WHICH STUDENT AND PROFESSOR HAVE THE MOST COURSES IN COMMON;
WITH courses_in_common AS (
SELECT COUNT(DISTINCT course_id) as counter, student_name, professor_name
FROM grades
JOIN student_table
ON student_id = student_student_id
JOIN professor
ON professor_id = professor_professor_id
GROUP BY student_name, professor_name
)
SELECT * from courses_in_common
WHERE  courses_in_common.counter = (
SELECT MAX(counter) from courses_in_common
);
-- ANSWER ABOVE DO NOT DELETE




