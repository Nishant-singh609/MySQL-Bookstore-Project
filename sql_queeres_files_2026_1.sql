create database college;
use college;
create table student(	
	stu_no serial primary key,
	srudent_name varchar(30),
    cource_name varchar(30)
	);

INSERT INTO student(srudent_name,cource_name)
        VALUES
		("nishant singh","b.tech"),
		("manshi singh","btech"),
		("ajay singh","btech"),
		("nishant singh","b.tech"),
		("manshi singh","btech"),
		("ajay singh","btech");

select * from student;
insert into student(srudent_name,cource_name)
values
("suman singh","btech"),
("riya singh","12th "),
("siya singh","10th"),
("ajay singh","7th class");

select * from student;