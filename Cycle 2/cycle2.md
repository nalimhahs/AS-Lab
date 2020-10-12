# Cycle 2

## Experiment 5:

### **Perform the following operations:**

1. Give select permission to all users for a table that you created already
2. Give all permission to all users for a table that you created already
3. Revoke all the permissions that you are given

### 1.

#### _Query_:

`CREATE LOGIN testLogin with PASSWORD = 'P@ssword12';`
`Create user testUser for login testLogin;`
`grant select on Department_39 to testUser;`

### 2.

#### _Query_:

`grant all on Department_39 to testUser;`

### 3.

#### _Query_:

`revoke all on Department_39 to testUser;`

#### _Output:_

```
The ALL permission is deprecated and maintained only for compatibility. It DOES NOT imply ALL permissions defined on the entity. 
```


## Experiment 6:

### **Perform the following operations:**

1. Change the name of the student with id 44553 as john
2. Commit all the operations
3. Change the name of the student with id 44553 as ‘Peltier’
4. Rollback all the operations
5. Insert a new row into a table student, make 3 updates to the new row and after 2 updates set savepoints.
6. Rollback to each savepoint

### 1.

#### _Query_:

`begin tran name_change;`
`update Student_39 set name = 'John' where id = '44553';`

#### _Output:_

```
(1 row affected) 
```

### 2.

#### _Query_:

`commit;`
`select * from Student_39;`

#### _Output:_

```
ID	    name	dept_name	tot_cred

128	    Zhang	Comp. Sci.	102
12345	Shankar	Comp. Sci.	42
19991	Brandt	History	80
23121	Chavez	Finance	110
44553	John	Physics	56
45678	Mozart	Physics	56
54321	Williams	Comp. Sci.	54
55739	Sanchez	Music	48
76543	Brown	Comp. Sci.	58
76653	Aoi	Elec. Eng.	60
98765	Bourikas	Elec. Eng.	98
98988	Tanaka	Biology	120
```

### 3.

#### _Query_:

`begin tran name_change2;`
`update Student_39 set name = 'John' where id = '44553';`
`select * from Student_39;`

#### _Output:_

```
ID	    name	dept_name	tot_cred

128	    Zhang	Comp. Sci.	102
12345	Shankar	Comp. Sci.	42
19991	Brandt	History	80
23121	Chavez	Finance	110
44553	Peltier	Physics	56
45678	Mozart	Physics	56
54321	Williams	Comp. Sci.	54
55739	Sanchez	Music	48
76543	Brown	Comp. Sci.	58
76653	Aoi	Elec. Eng.	60
98765	Bourikas	Elec. Eng.	98
98988	Tanaka	Biology	120
```


### 4.

#### _Query_:

`rollback;`
`select * from Student_39;`

#### _Output:_

```
ID	    name	dept_name	tot_cred

128	    Zhang	Comp. Sci.	102
12345	Shankar	Comp. Sci.	42
19991	Brandt	History	80
23121	Chavez	Finance	110
44553	John	Physics	56
45678	Mozart	Physics	56
54321	Williams	Comp. Sci.	54
55739	Sanchez	Music	48
76543	Brown	Comp. Sci.	58
76653	Aoi	Elec. Eng.	60
98765	Bourikas	Elec. Eng.	98
98988	Tanaka	Biology	120
```


### 5.

#### _Query_:

`begin tran;`
`insert into Student_39 values(99999, 'Test', 'History', 20);`
`update Student_39 set name = 'Johnny' where id = '99999';`
`update Student_39 set tot_cred = 50 where id = '99999';`
`save tran a;`
`update Student_39 set dept_name = 'Music' where id = '99999';`
`select * from Student_39;`


#### _Output:_

```
ID	    name	dept_name	tot_cred

128	    Zhang	Comp. Sci.	102
12345	Shankar	Comp. Sci.	42
19991	Brandt	History	80
23121	Chavez	Finance	110
44553	John	Physics	56
45678	Mozart	Physics	56
54321	Williams	Comp. Sci.	54
55739	Sanchez	Music	48
76543	Brown	Comp. Sci.	58
76653	Aoi	Elec. Eng.	60
98765	Bourikas	Elec. Eng.	98
98988	Tanaka	Biology	120
99999	Johnny	Music	50
```

### 6.

#### _Query_:

`rollback transaction a;`
`select * from Student_39;`

#### _Output:_

```
ID	    name	dept_name	tot_cred

128	    Zhang	Comp. Sci.	102
12345	Shankar	Comp. Sci.	42
19991	Brandt	History	80
23121	Chavez	Finance	110
44553	John	Physics	56
45678	Mozart	Physics	56
54321	Williams	Comp. Sci.	54
55739	Sanchez	Music	48
76543	Brown	Comp. Sci.	58
76653	Aoi	Elec. Eng.	60
98765	Bourikas	Elec. Eng.	98
98988	Tanaka	Biology	120
99999	Johnny	History	50
```

## Experiment 7

### **Views and Assertions**

1. Create a view named ‘yearwise’ from table section which shows the details for the courses on 2009
2. Create a view named ‘studentlist’ from table student which shows the details of students in alphabetical order
3. Create a view named ‘teacher’ which shows the details of teacher who are not taking any class
4. Insert a new row into view studentlist and update the name of student as ‘saviour’ to the new row
5. Delete the new row added to the view studentlist
6. Drop all the views created

#### _Query_:

### 1.

`create view yearwise as select * from Section_39 where year = 2009;`
`select * from yearwise;`

```
course_id	sec_id	semester	year	building	room_number

BIO-101	1	Summer	2009	Painter	514
CS-101	1	Fall	2009	Packard	101
CS-190	1	Spring	2009	Taylor	3128
CS-190	2	Spring	2009	Taylor	3128
CS-347	1	Fall	2009	Taylor	3128
EE-181	1	Spring	2009	Taylor	3128
PHY-101	1	Fall	2009	Watson	100
```

### 2.

`create view studentlist as (select * from Student_39 order by name);`
`select * from studentlist;`

```
ID	    name	dept_name	tot_cred

76653	Aoi	Elec. Eng.	60
98765	Bourikas	Elec. Eng.	98
19991	Brandt	History	80
76543	Brown	Comp. Sci.	58
23121	Chavez	Finance	110
44553	John	Physics	56
99999	Johnny	History	50
45678	Mozart	Physics	56
55739	Sanchez	Music	48
12345	Shankar	Comp. Sci.	42
98988	Tanaka	Biology	120
54321	Williams	Comp. Sci.	54
128	    Zhang	Comp. Sci.	102
```

### 3.

`create view teach as (select * from Instructor_39 where id not in (SELECT id FROM Teaches_39));`
`select * from teach;`

```
ID  	name	    dept_name	salary

22222	Einstein	Physics	104500
33456	Gold	    Physics	95700
58583	Califieri	History	71610
```

### 4.

`insert into studentlist values(100, 'thomas', 'Physics', 100);`
`update studentlist set name = 'saviour' where ID = 100;`
`select * from studentlist;`


```
ID	    name	dept_name	tot_cred

76653	Aoi	Elec. Eng.	60
98765	Bourikas	Elec. Eng.	98
19991	Brandt	History	80
76543	Brown	Comp. Sci.	58
23121	Chavez	Finance	110
44553	John	Physics	56
99999	Johnny	History	50
45678	Mozart	Physics	56
55739	Sanchez	Music	48
100	    saviour	Physics	100
12345	Shankar	Comp. Sci.	42
98988	Tanaka	Biology	120
54321	Williams	Comp. Sci.	54
128	    Zhang	Comp. Sci.	102
```

### 5.

`delete from studentlist where name="saviour";`

```
Commands completed successfully.
```

### 6.

`drop view studentlist;`
`drop view yearwise;`
`drop view teach;`

#### _Output:_

```
Commands completed successfully.
```



## Experiment 8
### **BUILT IN FUNCTIONS**

1. Evaluate the following using Built in functions
    a. Cos(absolute(-10))* e^2) ,print the rounded value
    b. Log10(((5^4)%14)) , print the result as 2 digit in decimal part
    c. Sin(30)+tan(60), also print the sign of the result
2. Find the greatest preceding or the least succeeding integer of 12.9
3. Display Name of instructor as Uppercase, lowercase letters, and also shows as first letter in capital in separate columns
4. Replace the '-' in Course_id with '/' and display it as new column
5. Display the name of instructor with department name as full name
6. Display the last 3 numbers from course id


### 1.

`select round(cos(abs(-10))*exp(2), 1) as result1;`
`select log10(sqrt((power(5, 4)%14))) as result2;`
`select sin(30)+tan(60), sign(sin(30)+tan(60)) as result3;`

```
result1

-6

result2

0.477121254719662

(No column name)	result3

-0.667991234713299	-1
```

### 2.

`select ceiling(12.9) as ceil, floor(12.9) as floor;`

```
ceil	floor

13	    12
```

### 3.

`select upper(name) as upper, lower(name) as lower, concat(UPPER(LEFT(name,1)), LOWER(SUBSTRING(name,2,LEN(name)))) as capitalized from Instructor_39;`

```
upper	    lower	    capitalized

SRINIVASAN	srinivasan	Srinivasan
WU	        wu	        Wu
MOZART	    mozart	    Mozart
EINSTEIN	einstein	Einstein
EL SAID	    el said	    El said
GOLD	    gold	    Gold
KATZ	    katz	    Katz
CALIFIERI	califieri	Califieri
CRICK	    crick	    Crick
BRANDT	    brandt	    Brandt
KIM	        kim	        Kim
```

### 4.

`select *, replace(course_id, '-', '/') as new_id from Course_39;`

```
course_id	title	dept_name	credits	new_id

BIO-101	Intro. to Biology	Biology	4	BIO/101
BIO-301	Genetics	Biology	4	BIO/301
CS-101	Intro. to Computer Science	Comp. Sci.	4	CS/101
CS-190	Game Design	Comp. Sci.	4	CS/190
CS-315	Robotics	Comp. Sci.	4	CS/315
CS-319	Image Processing	Comp. Sci.	4	CS/319
CS-347	Database System Concepts	Comp. Sci.	4	CS/347
EE-181	Intro. Digital Systems	Elec. Eng.	3	EE/181
FIN-201	Investment Banking	Finance	3	FIN/201
HIS-351	World History	History	3	HIS/351
MU-199	Music Video Production	Music	3	MU/199
PHY-101	Physical Principles	Physics	4	PHY/101
```

### 5.

`select concat(name, '-', dept_name) as full_name from Instructor_39;`

```
full_name

Srinivasan-Comp. Sci.
Wu-Finance
Mozart-Music
Einstein-Physics
El Said-History
Gold-Physics
Katz-Comp. Sci.
Califieri-History
Crick-Biology
Brandt-Comp. Sci.
Kim-Elec. Eng.
```

### 6.

`select right(course_id, 3) as course_id from Course_39;`

```
course_id

101
301
101
190
315
319
347
181
201
351
199
101
```

## Experiment 9
### **AGGREGATE FUNCTIONS**

1. Find the sum of the salaries of all instructors, the maximum salary, the minimum salary, and the average salary.
2. Find the sum of the salaries of all instructors of the 'History' department, as well as the maximum salary, the minimum salary, and the average salary in  his department.
3. Retrieve the total number of instructors in the institution
4. Retrieve the total number of instructors in the 'Computer science' department
5. Count the number of distinct salary values in the database.


### 1.

`select sum(salary) as sum, min(salary) as min, max(salary) as max, avg(salary) as avg from Instructor_39;`

```
sum	    min	    max	    avg

916245	46200	104500	83295
```

### 2.

`select sum(salary) as sum, min(salary) as min, max(salary) as max, avg(salary) as avg from Instructor_39 where dept_name='History';`

```
sum	    min 	max	    avg

140910	69300	71610	70455
```

### 3.

`select count(*) from Instructor_39;`

```
(No column name)

11
```

### 4.

`select count(*) as comp_instructor from Instructor_39 where dept_name = 'Comp. Sci.';`

```
comp_instructor

3
```

### 5.

`select count(distinct salary) from Instructor_39;`

```
(No column name)

11
```

## Experiment 10
### **Group By and Having**

1. For each department, retrieve the department name, the number of instructors in the department, and their average salary.
2. For each course, retrieve the course_id, the semester, and the number of students who takes that course.
3. For each course on which more than two students taken, retrieve the course_id, the semester, and the number of students who takes that course.
4. For each course, retrieve the course_id, the instructor name, and the number of courses taken from each department
5. For each department that has more than two instructors, retrieve the department name and the number of its instructors who are making more than $80,000.


### 1.

`select dept_name, count(*), avg(salary) from Instructor_39 group by dept_name;`

```
dept_name	(No column name)	(No column name)
Biology	    1	83160
Comp. Sci.	3	86258
Elec. Eng.	1	88000
Finance	    1	99000
History	    2	70455
Music	    1	46200
Physics	    2	100100
```

### 2.

`select course_id, semester, count(*) from Subject_39 group by semester;`

```
course_id	semester	(No column name)

CS-101	    Fall	    6
CS-347  	Fall	    2
PHY-101 	Fall	    1
CS-101  	Spring	    1
CS-190  	Spring	    2
CS-315   	Spring  	2
CS-319  	Spring  	2
EE-181  	Spring   	1
FIN-201 	Spring  	1
HIS-351	    Spring  	1
MU-199  	Spring  	1
BIO-101 	Summer  	1
BIO-301	    Summer  	1
```

### 3.

`select course_id, semester, count(*) from Subject_39 group by course_id, semester having count(*) >= 2;`

```
course_id	semester	(No column name)

CS-101	    Fall	    6
CS-347  	Fall	    2
CS-190  	Spring  	2
CS-315  	Spring  	2
CS-319  	Spring  	2
```

### 4.

``

```

```

### 5.

`select dept_name, count(*) from Instructor_39 where salary > 80000 group by dept_name having count(*) >= 2;`

```
dept_name	(No column name)

Comp. Sci.	2
Physics	    2
```

