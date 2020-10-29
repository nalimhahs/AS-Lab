-- create trigger course_update 
-- on Course_39
-- after UPDATE 
-- as begin
--     select i.credits as new_credits, d.credits as old_credits
--     from inserted i, deleted d
--     where i.course_id = d.course_id
-- end

-- update Course_39 set credits = credits - 1
-- where course_id = 'BIO-101';



-- create table Instructor_update(
--     inst_id int,
--     old_sal int,
--     new_sal int
-- );

-- create trigger instructor_update_trigger
-- on Instructor_39
-- after UPDATE 
-- as begin
--     insert into Instructor_update 
--         select i.id, d.salary, i.salary
--         from inserted i, deleted d
--         where i.id = d.id
-- end

-- update Instructor_39 set salary = salary + 10000
-- where id = 10101;
-- select * from Instructor_update;


-- create trigger course_credit_check 
-- on Course_39
-- instead of INSERT 
-- as begin
--     declare
--         @course_id as int
--     select @course_id = course_id from inserted;
--     if @course_id > 3
--     begin
--         insert into Course_39
--             select * from inserted
--     end
-- end


-- create trigger takes_delete_check 
-- on Subject_39
-- instead of DELETE 
-- as begin
--     declare
--         @year as int,
--         @sem as varchar
--     select @year = [year], @sem = semester from deleted;
--     if @year != 2009 and @sem != 'Fall'
--     begin
--         delete Subject_39 from deleted d where Subject_39.id = d.id and Subject_39.course_id = d.course_id and Subject_39.sec_id = d.sec_id and Subject_39.[year] = d.[year];
--     end
-- end

