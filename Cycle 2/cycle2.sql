-- use aslab;

-- CREATE LOGIN testLogin with PASSWORD = 'P@ssword12';
-- Create user testUser for login testLogin;

-- grant select on Department_39 to testUser;

-- revoke all on Department_39 to testUser;

-- begin tran name_change;
-- update Student_39 set name = 'John' where id = '44553';
-- commit;

-- select * from Student_39;

-- begin tran name_change2;
-- update Student_39 set name = 'Peltier' where id = '44553';
-- select * from Student_39;
-- rollback;
-- select * from Student_39;


-- begin tran;
-- insert into Student_39 values(99999, 'Test', 'History', 20);

-- update Student_39 set name = 'Johnny' where id = '99999';

-- update Student_39 set tot_cred = 50 where id = '99999';

-- save tran a;
-- update Student_39 set dept_name = 'Music' where id = '99999';

-- select * from Student_39;

-- rollback transaction a;
-- select * from Student_39;

-- create view yearwise as select * from Section_39 where year = 2009;
-- select * from yearwise;

-- create view studentlist as (select * from Student_39 order by name);
-- select * from studentlist;

-- create view teacher as (SELECT * from Instructor_39 where id not in (SELECT id FROM Teaches_39));
-- select * from teacher;

-- insert into studentlist values(100, 'thomas', 'Physics', 100);

-- update studentlist set name = 'saviour' where ID = 100;


-- select round(cos(abs(-10))*exp(2), 1) as result1;
-- select log10(sqrt((power(5, 4)%14))) as result2;
-- select sin(30)+tan(60), sign(sin(30)+tan(60)) as result3;


-- select ceiling(12.9) as ceil, floor(12.9) as floor;

-- select upper(name) as upper, lower(name) as lower, concat(UPPER(LEFT(name,1)), LOWER(SUBSTRING(name,2,LEN(name)))) as capitalized from Instructor_39;

-- select *, replace(course_id, '-', '/') as new_id from Course_39;

-- select concat(name, '-', dept_name) as full_name from Instructor_39;

-- select right(course_id, 3) as course_id from Course_39;

-- select sum(salary) as sum, min(salary) as min, max(salary) as max, avg(salary) as avg from Instructor_39;

-- select sum(salary) as sum, min(salary) as min, max(salary) as max, avg(salary) as avg from Instructor_39 where dept_name='History';

-- select count(*) from Instructor_39;

-- select count(*) as comp_instructor from Instructor_39 where dept_name = 'Comp. Sci.';

-- select count(distinct salary) from Instructor_39;

-- select dept_name, count(*), avg(salary) from Instructor_39 group by dept_name;

-- select course_id, semester, count(*) from Subject_39 group by course_id, semester;

-- select course_id, semester, count(*) from Subject_39 group by course_id, semester having count(*) >= 2;

-- select course_id, name,  from Course_39, Instructor_39

-- select dept_name, count(*) from Instructor_39 where salary > 80000 group by dept_name having count(*) >= 2;