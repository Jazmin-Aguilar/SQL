SELECT student.id, takes.course_id FROM student
FULL OUTER JOIN takes USING(id)
WHERE course_id IS NULL;

SELECT student.id FROM student
LEFT OUTER JOIN takes USING(id)
WHERE takes.id IS NULL;