-- use aslab;

-- create table Flights (flno int, from_l varchar(20), to_l varchar(20), distance int, departs date, arrives date, primary key (flno));
-- create table Aircraft (aid int, aname varchar(20), cruisingrange int, primary key (aid));
-- create table Employees (eid int, ename varchar(20), salary int, primary key (eid));
-- create table Certified (eid int, aid int, primary key (eid, aid), foreign key(eid) references Employees(eid), foreign key(aid) references Aircraft(aid));
-- create table AssignedAircraft (aid int, flno int, primary key (aid, flno), foreign key(flno) references Flights(flno), foreign key(aid) references Aircraft(aid));

-- insert into Flights
-- values 
--     (1, 'COK', 'DXB', 1000, '2021-02-10', '2021-02-11'),
--     (2, 'COK', 'DXB', 1500, '2021-02-10', '2021-02-11'),
--     (3, 'COK', 'DXB', 6600, '2021-02-10', '2021-02-11'),
--     (4, 'COK', 'DXB', 2700, '2021-02-10', '2021-02-11'),
--     (5, 'COK', 'DXB', 4800, '2021-02-10', '2021-02-11'),
--     (6, 'COK', 'DXB', 3000, '2021-02-10', '2021-02-11');

-- insert into Aircraft
-- values 
--     (1, 'Tesla', 5000),
--     (2, 'Tiger', 2000),
--     (3, 'Asd', 1000),
--     (4, 'Airstud', 4000),
--     (5, 'Ford', 7000),
--     (6, 'Honduras', 9000);

-- insert into Employees
-- values 
--     (1, 'Milan', 50000),
--     (2, 'Sahil', 20000),
--     (3, 'Risal', 10000),
--     (4, 'Anna', 40000),
--     (5, 'Anit', 70000),
--     (6, 'Reenu', 90000);

-- insert into Certified
-- values 
--     (1, 1),
--     (2, 3),
--     (3, 2),
--     (4, 4),
--     (5, 6),
--     (6, 5);

-- insert into AssignedAircraft
-- values 
--     (1, 1),
--     (2, 3),
--     (3, 2),
--     (4, 4),
--     (5, 6),
--     (6, 5);

-- update Aircraft set aname = 'Boeing' where aid > 4;

-- Question 1
-- 1. Find the names of employees who can operate planes with a
--  range greater than 3,000 miles but are not certified on any Boeing Aircraft.

-- select e.eid, e.ename from certified c INNER JOIN Aircraft a ON a.aid = c.aid INNER JOIN Employees e on e.eid = c.eid
-- where a.cruisingrange > 3000 and a.aname not like 'Boeing'; 


-- Question 2
-- 2. Find the details of employees who make the second highest salary.

-- select * from Employees 
-- where salary = (select max(salary) as salary from Employees
--     where salary < (select max(salary) from Employees));

-- Question 3
-- 3. Find the Eids of employees who are certified 
-- for exactly three aircraft and their aircraft name starting with the letter ‘T’.

-- insert into Certified
-- values 
--     (1, 6),
--     (1, 3),
--     (1, 2),
--     (1, 4);

-- Update rows in table 'Certified'
-- UPDATE Aircraft
-- SET
--     aname = 'Tarara'
-- WHERE 	aid = 3;


-- select e.eid, count(e.eid) as cert_count from certified c INNER JOIN Aircraft a ON a.aid = c.aid and a.aname like 'T%' INNER JOIN Employees e on e.eid = c.eid
-- group by e.eid having count(e.eid) = 3; 


-- TRIGGER
-- deletion is possible in employee table if the employee’s salary is less than 50,000.

-- insert into Employees
-- values 
--     (9, 'Sneha', 60000),
--     (10, 'Shahil', 20000);


-- create trigger delete_check 
-- on Employees
-- instead of DELETE 
-- as begin
--     declare
--         @salary as int
--     select @salary = salary from deleted;
--     if @salary < 50000
--     begin
--         delete from Employees where eid = (select eid from deleted);
--     end
-- end

-- delete from Employees where eid = 9;
-- select * from Employees;