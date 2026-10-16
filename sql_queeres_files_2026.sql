create database company;
use company;
create table employees(E_id serial primary key,
                       First_name varchar(30) not null,
                       Secound_name varchar(30) not null,
                       Department varchar(50),
                       Salary decimal(10.2) check (salary>0),
                       joing_date date not null,
                       age int check (age>=18));

select *from employees;
insert into employees(First_name,Secound_name,Department,Salary,joing_date,age)
values
("nishat","singh","science",20000.00,"2023-02-22",19),
("manshi","singh","sells",90000.00,"2024-02-22",19),
("ajay","singh","shoftwere",28000.00,"2000-02-22",19),
("sunil","singh","science",30000.00,"5000-02-22",19),
("vikah","singh","science",90000.00,"4000-02-22",19),
("subham","singh","science",20000.00,"2000-02-22",19),
('aman', 'sharma', 'IT', 40000.00, '2024-05-15', 22),
('rohan', 'verma', 'IT', 45000.00, '2023-08-10', 24),
("niraj","singh","science",80000.00,"2000-02-22",19),
('aman', 'sharma', 'IT', 40000.00, '2024-05-15', 22),
('rohan', 'verma', 'IT', 45000.00, '2023-08-10', 24),
("dhiraj","singh","science",90000.00,"2000-02-22",19),
("subham","singh","science",50000.00,"2000-02-22",19),
("ajay","singh","pharmecy",60000.00,"2000-02-22",19),
("abay","singh","medical",40000.00,"2000-02-22",19),
("ritik","singh","engineering",30000.00,"2000-02-22",19),
('aman', 'sharma', 'IT', 40000.00, '2024-05-15', 22),
('rohan', 'verma', 'IT', 45000.00, '2023-08-10', 24),
("rahul", "sharma", "data science", 35000.00, "2023-06-15", 22),
("priya", "verma", "sales", 42000.00, "2024-01-10", 23),
('aman', 'sharma', 'IT', 40000.00, '2024-05-15', 22),
('rohan', 'verma', 'IT', 45000.00, '2023-08-10', 24),
("amit", "kumar", "software", 55000.00, "2022-08-20", 24),
("rohit", "singh", "finance", 30000.00, "2023-03-12", 21),
("neha", "gupta", "marketing", 48000.00, "2024-05-18", 22),
("ankit", "yadav", "science", 25000.00, "2022-11-25", 23),
("pooja", "patel", "data analytics", 60000.00, "2021-07-14", 25),
("vikas", "mishra", "engineering", 45000.00, "2023-09-05", 24);


select * from employees;

insert into employees(First_name,Secound_name,Department,Salary,joing_date,age)values
("arjun", "patel", "data science", 45000.00, "2023-04-12", 22),
("simran", "kaur", "human resources", 38000.00, "2022-08-19", 24),
("karan", "mehta", "software", 65000.00, "2021-06-25", 26),
("anjali", "sharma", "sales", 32000.00, "2024-02-14", 21),
("deepak", "verma", "finance", 52000.00, "2022-11-10", 25),
("kavita", "gupta", "marketing", 41000.00, "2023-07-08", 23),
("mohit", "yadav", "engineering", 58000.00, "2021-09-17", 27),
("sneha", "singh", "data analytics", 47000.00, "2024-03-21", 22),
("varun", "mishra", "science", 36000.00, "2023-01-16", 24),
("riya", "jain", "software", 72000.00, "2020-05-11", 28),
("akash", "kumar", "sales", 29000.00, "2024-06-09", 21),
("payal", "thakur", "pharmacy", 44000.00, "2022-12-13", 25),
("saurabh", "rai", "data science", 68000.00, "2021-04-22", 26),
("divya", "joshi", "finance", 39000.00, "2023-10-05", 23),
("manish", "dubey", "engineering", 55000.00, "2022-02-18", 25),
("tanvi", "agrawal", "marketing", 46000.00, "2024-04-07", 22),
("rahul", "tiwari", "software", 61000.00, "2020-11-29", 27),
("isha", "malhotra", "data analytics", 50000.00, "2023-08-15", 24),
("nitin", "saxena", "science", 34000.00, "2022-07-20", 23),
("meena", "choudhary", "human resources", 43000.00, "2024-01-30", 22);

truncate table employees;
select *from employees;

# retrive the all employees first name and their department
select first_name,Department from employees;
 # to retrive the department data from the employees
 select * from the employees;
# 2Q update the salary of the all employees in the department  by the incremnet 10% salary of the it department 
update employees
set Salary=Salary*1.10
where Department='IT';

UPDATE employees
SET Salary = Salary * 1.10
WHERE Department = 'IT';

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET Salary = Salary * 1.10
WHERE Department = 'IT';

SET SQL_SAFE_UPDATES = 1;

# to incremt the data 10 % salary in the pharmecy  department 
SET SQL_SAFE_UPDATES = 0;
update  employees
set  Salary = Salary * 1.10
where Department = 'IT';
SET SQL_SAFE_UPDATES = 1;
select * from employees;
# to the delet e the all mployees recound the who is older than 20 eas in the data 
SET SQL_SAFE_UPDATES=0;
delete from employees
where age<=20;
SET SQL_SAFE_UPDATES=1;
select * from employees;

# add the column new email column inthe emloyees clumn table

alter table employees
add column email varchar(50);

# to change and rename te Department to dept_name 
alter table employees
rename column Department to dept_name;

select First_name,Secound_name,joing_date from employees
where joing_date>'2023-02-22';

# retive the name of the employees who joied the after  date '2021-01-01'
select * from employees;

# to the chnge the column data type the salary clumn in the integer

 alter table employees
 modify column Salary INTEGER;
 
 
# to retrive or print the data in the single fomate the data deceiniing order 
select * from employees 
order by joing_date asc;
 # to retrive or print the data in the single fomate the data assending order 
select * from employees 
order by joing_date asc;

# to add the new employees in the  employees  table ;
insert into employees(First_name,Secound_name,Salary,joing_date,age,email) values
("suraj","singh",100000,'2025-02-02',37,'nishntsingh78151@gmail.com');
# To add or increment he 1 year in the age 
select * from employees;
SET SQL_SAFE_UPDATES = 0;
update employees 
set  age=age+1;
SET SQL_SAFE_UPDATES =1;

