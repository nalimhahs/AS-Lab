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