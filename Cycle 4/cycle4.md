# Cycle 4

## Experiment 1:

### **Triggers**

1. Write a trigger on the Course table which shows the old values and new values of credits after any updations on credits on Course table.
2. Write a trigger to insert the old and new values of salary in the Instructor table into a new table when the Instructor table is updated and salary difference should be displayed.
3. Write a trigger to ensure that no course of credits less than 3 can be inserted in the Course table.
4. Write a trigger to ensure that no row with year 2009 and semester Fall can be deleted from the Takes table.
5. Delete all the triggers created.

### 1.

#### _Query_:

```
create trigger course_update 
on Course_39
after UPDATE 
as begin
    select i.credits as new_credits, d.credits as old_credits
    from inserted i, deleted d
    where i.course_id = d.course_id
end

update Course_39 set credits = credits - 1
where course_id = 'BIO-101';
```

#### _Output:_

```
new_credits	    old_credits

3	            4
```

### 2.

#### _Query_:

```
create table Instructor_update(
    inst_id int,
    old_sal int,
    new_sal int
);

create trigger instructor_update_trigger
on Instructor_39
after UPDATE 
as begin
    insert into Instructor_update 
        select i.id, d.salary, i.salary
        from inserted i, deleted d
        where i.id = d.id
end

update Instructor_39 set salary = salary + 10000
where id = 10101;
select * from Instructor_update;
```

#### _Output:_

```
inst_id	    old_sal	    new_sal

10101	    75075	    85075
```

### 3.

#### _Query_:

```
create trigger course_credit_check 
on Course_39
instead of INSERT 
as begin
    declare
        @course_id as int
    select @course_id = course_id from inserted;
    if @course_id > 3
    begin
        insert into Course_39
            select * from inserted
    end
end
```

#### _Output:_

```
Commands completed successfully. 
```

### 4.

#### _Query_:

```
create trigger takes_delete_check 
on Subject_39
instead of DELETE 
as begin
    declare
        @year as int,
        @sem as varchar
    select @year = [year], @sem = semester from deleted;
    if @year != 2009 and @sem != 'Fall'
    begin
        delete Subject_39 from deleted d where Subject_39.id = d.id and Subject_39.course_id = d.course_id and Subject_39.sec_id = d.sec_id and Subject_39.[year] = d.[year];
    end
end
```

#### _Output:_

```
Commands completed successfully. 
```

### 5.

#### _Query_:

```
drop trigger course_update;
drop trigger instructor_update_trigger;
drop trigger course_credit_check;
drop trigger takes_delete_check;
```

#### _Output:_

```
Commands completed successfully. 
```


## Experiment 2:

### **Triggers**

1. Write a PL/SQL program to create a cursor that displays the name, department and salary of each instructor in the INSTRUCTOR table whose salary is less than that specified by a passed-in parameter value.
2. Write a PL/SQL program to create a cursor that displays the department name, number of instructors and number of courses listed in each department.
3. Write a PL/SQL program to display instructor id, name and salary of 5 highest paid instructors using cursor.
4. Write a PL/SQL program to increase salary of instructors in department specified by a parameter using cursor. The salary increase is 20% for instructors making less than 80,000 and 12% for the employees making 80,000 or more. 

### 1.

#### _Query_:

```
DECLARE
    cursor inst is
        select * from Instructor_39;
    sal integer := 50000;
BEGIN
    FOR n IN inst LOOP
        if n.salary < sal
        then
            dbms_output.put_line(n.name || n.dept_name || n.salary);
        end if;
    END LOOP;
END;
```

#### _Output:_

```
Statement processed.
MozartMusic40000
```

### 2.

#### _Query_:

```
DECLARE
    cursor dept is
        select dept_name from Department_39;
    inst integer := 0;
    course integer := 0;
BEGIN
    FOR n IN dept LOOP
        select count(id) into inst from Instructor_39 where dept_name = n.dept_name;
        select count(course_id) into course from Course_39 where dept_name = n.dept_name;
        dbms_output.put_line(n.dept_name || inst || course);
    END LOOP;
END;
```

### 3.

#### _Query_:

```
DECLARE
    cursor inst is
        select * from Instructor_39 order by salary desc;
    cnt integer := 0;
BEGIN
    FOR n IN inst LOOP
        if cnt < 5
        then
            dbms_output.put_line(n.id || n.name || n.salary);
            cnt := cnt + 1;
        end if;
    END LOOP;
END;
```

#### _Output:_

```
Statement processed.
22222Einstein95000
83821Brandt92000
12121Wu90000
33456Gold87000
76543Singh80000
```

### 4.

#### _Query_:

```
DECLARE
    cursor inst is
        select * from Instructor_39 order by salary desc;
BEGIN
    FOR n IN inst LOOP
        if n.salary < 80000
        then
            update Instructor_39 set salary = 1.2 * salary where id = n.id;
        elsif n.salary >= 80000
        then
            update Instructor_39 set salary = 1.12 * salary where id = n.id;
        end if;
    END LOOP;
END;
```

#### _Output:_

```
ID	    NAME	    DEPT_NAME	SALARY
22222	Einstein	Physics	    95000
45565	Katz	    Comp. Sci.	75000
58583	Califieri	History	    62000
10101	Srinivasan	Comp. Sci.	65000
15151	Mozart	    Music	    40000
33456	Gold	    Physics	    87000
76543	Singh	    Finance	    80000
76766	Crick	    Biology	    72000
83821	Brandt	    Comp. Sci.	92000
98345	Kim     	Elec. Eng.	80000
31343	El Said	    History	    60000
12121	Wu	        Finance	    90000
```