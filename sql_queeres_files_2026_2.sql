use company;
select * from employees;
select First_name,Secound_name,Salary,
(Salary*0.1) as Bonus,
Salary+(Salary*0.1) as total_salary from employees;

# again  to retrive the name salary ,annual_salary,5%incrementeaal salary,new mounth salary
select First_name,Secound_name,Salary,
(Salary*12) as Annual_salary,(Salary*0.05) as incremental_salary,
(Salary+Salary*0.5) as new_salary from employees;
# compirition oprator 
# =(equel) 
# !=,<> not equal to
# > grater than
# < less than
# <=grater than
# >= less  than 


# t solve the one by one qustion  by use the one by one oprator
# =(equel) 
select First_name,Secound_name,Salary from employees
where Salary=40000;
# !=,<> not equal to
select First_name,Secound_name,Salary from employees
where Salary !=40000;

select First_name,Secound_name,Salary from employees
where Salary <>40000;

# < grater than

select First_name,Secound_name,Salary from employees
where Salary >40000;

# < less than
select First_name,Secound_name,Salary from employees
where Salary >40000;

# <=grater than
select First_name,Secound_name,Salary from employees
where Salary <= 40000;

# >=less than equal to
select First_name,Secound_name,Salary from employees
where Salary >= 40000;
 # fnal i have soled the question  with in min;

  # days 16 the its basicaly i have to study  
  # there are three type of the logical opraton 
  # AND
  # OR
  # NOT 
  # LET ME explain ONE BY ONR OPRATER 
  # AND 
  select * from employees
  where (age>=25) AND (Salary>=40000);
  
# OR

 select * from employees
  where (age>=25) or (Salary>=40000);
  
# NOT
 select * from employees
  where not (age=24) ;
  
# days 16th between like and in oprator 
# between oprators
select * from employees;
select First_name,Secound_name,Salary from employees
where Salary between 40000 and 60000;

select First_name,Secound_name,Salary,age from employees;
# like oprator 
select First_name,Secound_name,Salary from employees
where First_name like '%a'; # ending later must be a hoga

select First_name,Secound_name,Salary from employees
where First_name like 'a%'; # starting a hoga

select First_name,Secound_name,Salary from employees
where First_name like '%a%'; # between a hoga
 
# IN oprators

select First_name,Secound_name,Salary,age from employees
where age in(23,24,20);
