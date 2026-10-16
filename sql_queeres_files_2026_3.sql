# to study in the my sql  to  joint chapter easly;
# to crete the two table 
#fist table in the employee_1
use company;
create table employee_1(E_id int primary key ,
                        first_name varchar(30),
                        last_name varchar(30),
                        department_id int 
                        );
# to insert the values in the table employee_1

insert into employee_1(E_id,first_name,last_name,department_id)
 values(1,"manshi","singh",101),
      (2,"nishant","singh",102),
      (3,"sunil","khuswaha",103),
      (4,"priya","singh",null),
      (5,"aman","singh",101);
      
select * from employee_1;
 
 
 # to create the secunt table the table name is the departemanet
 
 create table department_1(department_id int primary key,
						   department_name varchar(30));
      

select * from department_1;

# to insert the value of the table in the department_ table value 

insert into department_1(department_id,department_name)
                   values(101,"salses"),
                         (102,"marketing"),
                         (103,"it"),
                         (104,"HR"),
                         (105,"SCIENCE"),
                         (106,"car");

select * from department_1; 
# I know to apply and how to use in the joint not the two or two more than by using
# inner join 
# left join
# right join
# cross join 
# self join
# first to the use the inner join the -> its basicaly joint the two r two more table  by the comman table
select * from employee_1;
select * from department_1;
select e.E_id,e.first_name,e.last_name,e.department_id,d.department_id,d.department_name
from employee_1 e inner join department_1 d on
e.department_id=d.department_id; 

# to create the  two table and joint the two table by using inner joint 
 # to find the inner joint 
create table school_1(S_id int primary key ,
                      S_name varchar(30),
                      S_address varchar(30),
                      Fee int,S2_id int);
# insrt the data in the table  school_1
insert into school_1(S_id,S_name,S_address,Fee,S2_id)
                    values
                    (1,"nishant singh","bari",20000,101),
                    (2,"manshi singh","bari",26000,102),
                    (3,"priya singh","khamdih",300000,103),
                    (4,"ajay singh","pochi",200340,104),
                    (5,"diraj singh","satbarwa",78000,105),
                    (6,"suman singh","rajhara",90000,null);

select * from school_1;
# o crete the secound table name 
create table school_2(S2_id int primary key,
					  Collage_name varchar(30),
					  D_name varchar(30),
                      Teacher_name varchar(30));
 # insert the value of the secound table 
insert  into school_2(S2_id,Collage_name,D_name,Teacher_name) 
						values
						(101,"sirte","science","manshi singh"),
                        (102,"lnct","science","nishant singh"),
                        (103,"peopols","computer","Aniket singh"),
                        (104,"saam","medical","Ajay singh"),
                        (105,"mrsn","b.phrama","dhiraj singh"),
                        (106,"sfns","science","priya singh");

select * from school_2;

# to add the two table by the inner join 
# so e can easly add two table 
#inner join;
select * from school_1;
select * from school_2;
select s1.S_id,s1.S_name,
       s1.S_address,s1.Fee,
       s1.S2_id,s2.S2_id,
       s2.Collage_name,
       s2.D_name,s2.Teacher_name from school_1 s1 inner join school_2 s2 on s1.S2_id=s2.S2_id;
 
 # to covert in the left join
select s1.S_id,s1.S_name,
       s1.S_address,s1.Fee,
       s1.S2_id,s2.S2_id,
       s2.Collage_name,
       s2.D_name,s2.Teacher_name from school_1 s1 left join school_2 s2 on s1.S2_id=s2.S2_id; 
       
# right  join throunght easlyjoiint the two table 

select s1.S_id,s1.S_name,
       s1.S_address,s1.Fee,
       s1.S2_id,s2.S2_id,
       s2.Collage_name,
       s2.D_name,s2.Teacher_name from school_1 s1 right join school_2 s2 on s1.S2_id=s2.S2_id; 


# full outer join  retrive the all records  department  table and departmnet_2 non-mathing records from table i knonw as the full outer joiin
 
select s1.S_id,s1.S_name,
       s1.S_address,s1.Fee,
       s1.S2_id,s2.S2_id,
       s2.Collage_name,
       s2.D_name,s2.Teacher_name from school_1 s1 FULL OUTER JOIN school_2 s2 on s1.S2_id=s2.S2_id;
       
       
SELECT
    s1.S_id,
    s1.S_name,
    s1.S_address,
    s1.Fee,
    s1.S2_id,
    s2.S2_id,
    s2.Collage_name,
    s2.D_name,
    s2.Teacher_name
FROM school_1 AS s1
FULL OUTER JOIN school_2 AS s2
    ON s1.S2_id = s2.S2_id;
       
       
       
       
SELECT
    s1.S_id,
    s1.S_name,
    s1.S_address,
    s1.Fee,
    s1.S2_id,
    s2.S2_id,
    s2.Collage_name,
    s2.D_name,
    s2.Teacher_name
FROM school_1 s1
FULL OUTER JOIN school_2 s2
    ON s1.S2_id = s2.S2_id;
    
    
select * from department_1;
select * from employee_1;
       
SELECT
    s1.S_id,
    s1.S_name,
    s1.S_address,
    s1.Fee,
    s1.S2_id,
    s2.S2_id AS School2_ID,
    s2.Collage_name,
    s2.D_name,
    s2.Teacher_name
FROM school_1 AS s1
LEFT JOIN school_2 AS s2
    ON s1.S2_id = s2.S2_id

UNION ALL

SELECT
    s1.S_id,
    s1.S_name,
    s1.S_address,
    s1.Fee,
    s1.S2_id,
    s2.S2_id AS School2_ID,
    s2.Collage_name,
    s2.D_name,
    s2.Teacher_name
FROM school_1 AS s1
RIGHT JOIN school_2 AS s2
    ON s1.S2_id = s2.S2_id
WHERE s1.S2_id IS NULL;
       
       
# to use the cross join how to work in the cross join 
select e.E_id,e.first_name,e.last_name,
       e.department_id,d.department_id,
       d.department_name from employee_1 e cross join  department_1 d ; 