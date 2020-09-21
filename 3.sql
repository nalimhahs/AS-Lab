-- UPDATE Student_39
-- SET name = 'Mozart'
-- WHERE id = 45678;
-- SELECT * FROM Student_39;

-- UPDATE Department_39
-- SET budget = 100000, building = 'Taylor'
-- WHERE dept_Name = 'History';
-- SELECT * FROM Department_39;

-- UPDATE Instructor_39
-- SET salary = salary * 1.1;
-- SELECT * FROM Instructor_39;

-- UPDATE Course_39
-- SET credits = 4
-- WHERE dept_name = 'Comp. Sci.';
-- SELECT * FROM Course_39;

-- UPDATE Student_39
-- SET tot_cred = tot_cred + 10
-- WHERE tot_cred BETWEEN 20 AND 50;
-- SELECT * FROM Student_39;

-- UPDATE Instructor_39
-- SET salary = salary * 1.05
-- WHERE salary < (SELECT AVG(salary) FROM Instructor_39);
-- SELECT * FROM Instructor_39;

-- UPDATE Teaches_39
-- SET year = 2010
-- WHERE course_id = 'CS-101' AND semester = 'Fall';
-- SELECT * FROM Teaches_39;

-- DELETE FROM Student_39 WHERE tot_cred = 0;
-- SELECT * FROM Student_39;

-- DELETE FROM Instructor_39 WHERE ID LIKE '765%';
-- SELECT * FROM Instructor_39;

-- DELETE FROM Course_39 WHERE course_id NOT IN (SELECT course_id FROM Section_39);
-- SELECT * FROM Course_39;

-- SELECT name, dept_Name FROM Instructor_39;

-- SELECT DISTINCT semester FROM Teaches_39;

-- SELECT name, salary * 1.1 FROM Instructor_39;

-- SELECT ID, name FROM Instructor_39
-- WHERE salary > 70000 AND dept_name = 'Comp. Sci.';

-- SELECT name, d.dept_Name, building FROM Instructor_39 AS i, Department_39 AS d
-- WHERE d.dept_Name = i.dept_name;

-- SELECT name, course_id FROM Instructor_39 AS i, Teaches_39 as t
-- WHERE t.ID = i.ID;

-- SELECT * FROM Course_39
-- WHERE title LIKE 'Intro%';

-- SELECT * FROM Course_39 WHERE title LIKE '%Comp%';

-- SELECT * FROM Student_39 WHERE name LIKE '___';

-- SELECT * FROM Instructor_39 WHERE name LIKE '%___%';