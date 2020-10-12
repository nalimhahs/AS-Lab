-- create database aslab;
use aslab;

-- create table Classroom_39 (building varchar(20), room_number int, capacity int, primary key (room_number));
-- create table Department_39 (dept_Name varchar(20), building varchar(20), budget int, primary key (dept_name));
-- create table Course_39 (course_id varchar(10), title varchar(40), dept_name varchar(20), credits int, primary key (course_id));
-- create table Instructor_39 (ID int, name varchar (20), dept_name varchar(20), salary int, primary key (ID));
-- create table Section_39 (course_id varchar(10), sec_id int, semester varchar(10), year int, building varchar(20), room_number int, primary key(Course_id, sec_id,year));
-- create table Student_39 (ID int, name varchar(20), dept_name varchar(20), tot_cred int, primary key (ID));
-- create table Teaches_39 (ID int, course_id varchar(10), sec_id int, semester varchar(10), year int, primary key(ID,Course_id,sec_id));
-- create table Takes_39 (ID int, course_id varchar(10), sec_id int, semester varchar(10), year int, grade varchar(3), primary key(ID,Course_id, sec_id,year));

-- alter table Course_39 add foreign key (dept_name) references Department_39(dept_Name);
-- alter table Instructor_39 add foreign key (dept_name) references Department_39(dept_Name);
-- alter table Student_39 add foreign key (dept_name) references Department_39(dept_Name);
-- alter table Section_39 add foreign key (course_id) references Course_39(course_id);
-- alter table Section_39 add foreign key (room_number) references Classroom_39(room_number);
-- alter table Teaches_39 add foreign key (course_id) references Course_39(course_id);
-- alter table Teaches_39 add foreign key (ID) references Instructor_39(ID);
-- alter table Takes_39 add foreign key (course_id) references Course_39(course_id);

-- alter table Course_39 alter column course_id varchar(10);

-- alter table Department_39 add dept_no int;
-- alter table Student_39 alter column name varchar(20) not null;
-- alter table Classroom_39 add constraint df_capacity default 50 for capacity;
-- alter table Department_39 add constraint uniq_dept_name unique(dept_name)
-- alter table Instructor_39 add constraint chk_salary check(salary > 50000);

-- alter table Department_39 drop column dept_no;
-- alter table Classroom_39  alter column capacity int null;
-- alter table Classroom_39 drop constraint df_capacity;
-- alter table Instructor_39 drop constraint chk_salary;
-- alter table Student_39 alter column name varchar(20) null;

-- exec sp_rename 'Takes_39', 'Subject_39';

SELECT * FROM Classroom_39;
SELECT * FROM Department_39;
SELECT * FROM Course_39;
SELECT * FROM Instructor_39;
SELECT * FROM Section_39;
SELECT * FROM Student_39;
SELECT * FROM Teaches_39;
SELECT * FROM Subject_39;
