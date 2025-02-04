 -- alter table student rename column Mobile to Phone_no; # alter use for rename coulmn, add coulmn , drop/delete the column.

-- alter table student drop column Age;

-- alter table student add age int;

use ankit;

insert into student(id,name,Phone_no,Address,age) values (1,"Ankit",6202889283,"Bihar",19),
(2,"Anuj",7864658945,"patna",21),
(3,"amit",9845124574,"mumbai",23),
(4,"shiv",7845124589,"indore",14),
(5,"shikha",784498425,;

select name,Address from student where age >20;
select * from student;
select name from student order by age asc;
select name, Address from student where id=1;

select count(*) from student;

-- Update Table--

update student set Address = "goa" where name = "Ankit" and id=1;

update student
set Address = "India" , age=40
where id =3;

update student set Address = "India";

-- UNDO THE CHANGES--
use ankit;
start transaction;

update student
set Address = "India" , age=14
where id =4;

rollback;

commit;

-- DELETE DATA FROM TABLE--

delete from student where name ="Ankit" and id =1;

delete from student where age <21;

delete from student where id in(2,3);

use ankit;
create table record2 (
Name varchar(20),
age tinyint,
salary smallint,
Height real );

insert into record2(Name,age,salary,Height) values ("Ankit",126,31000,1.56000),("Aditya",110,28000,1.600),("Anuj",100,30000,1.720),("Ajit",98,32000,1.792);

alter table record2 add column email varchar(10) after age;
alter table record2 modify column email varchar(30);
alter table record2 add column Gender char(5) after age;
insert	into record2 (email,Gender) values ('Ankittiwari8414@gmail.com','male');


alter table record2 add column Address tinytext after age;
insert into record2 (Address) value ('patna,bihar pincode 840001');
alter table record2 add column Paragraph Text,
add column Book mediumtext,
add column LongT Longtext;
insert into record2(Paragraph,Book,LongT)
values('A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.',"The story Begain","wikipedia");


use ankit;
create table Employees(
id int Auto_increment Primary key,
name varchar(100),
salary Decimal(10,2),
Address varchar(100),
Phone_number varchar(10),
pincode varchar(6) );


insert into employees(id,name,salary,Address,Phone_number,pincode) values (101,"Rohan",56000,"amnur",7894544744,841323),(102,"Mohan",45000,"jaitpur",9854567845,900098),(103,"Aditya",210000,"Patna",8465978945,800012);


use ankit;
create table localhost(
local_id int,
local_name varchar(20),
local_Address varchar(100),
local_phone varchar(10),
local_pincode varchar(6) ); 

insert into localhost(local_id,local_name,local_Address,local_phone,local_pincode) values (1,"Santa","panipuri",7985852556,076547),(2,"suraj","bihar",8888894586,840023),(3,"Ankit","saran",9864843216,789098);
alter table localhost rename column gender to local_gender;
use ankit;
start transaction;
update localhost 
set local_gender="male" where local_name ="santa" and local_id=1;
rollback;
commit;

use ankit;
delete from localhost where local_name ="santa" and local_id=1;
alter table localhost add column local_email varchar(20) after local_phone;
insert into localhost (local_email) value ("Ankittiwari8414@gmail.com");
alter table localhost modify local_email varchar(30);

alter table localhost drop column local_gender;
alter table localhost add column images longblob;

insert into localhost(images) values (load_file("C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/banner.png"));

-- SQL Function--
use record;
create table sqlEmp(
Department varchar(50),
name varchar(50),
salary int );
insert into sqlEmp(Department,name,salary)
values ("MTS","Daya",500000),("cashier","Ramesh",60000),("Training Officer ","Aadil",70000),("principal", "vamshi",100000);

select count(*) as total_data from sqlEmp;

select sum(salary) as total_data from sqlEmp;

select avg(salary) as Average_salary from sqlEmp; 

select max(salary) as Maximum_salary from sqlEmp;

select min(salary) as minimum_salary from sqlEmp;

select name, salary,Department from sqlEmp where salary=(select min(salary)as Minimum_salary from sqlEmp);

select count(name) as Training_Officer from sqlEmp where Department="Training Officer";

select Department, Max(salary)as max_salary from sqlEmp group by Department;

select Department, count(name) as total_number from sqlEmp group by Department;

select Department, name, sum(salary) as total_salary from sqlEmp group by Department, name;
 
 select Department, avg(salary) as Avg_Sal from sqlEmp group by Department Having avg (salary)>80000;

 create database ER;

use ER;

create table book(
B_id int primary key,
Title varchar(50),
Author varchar(50),
price varchar(10),
Publisher_name varchar(50),
foreign key (publisher_name) references publisher(name)
);

create table publisher(
Name varchar(50) primary key,
Address varchar(50),
Phone varchar(11) );

create table Library1(
Name varchar(50),
Address varchar (100));

create table Borrower(
Lib_card int primary key,
Name varchar(50),
Address varchar(100),
Phone varchar(11) );

create table copies(
Book_id int,
Branch_id int,
No_of_copies int,
foreign key(Book_id) references book(B_id));

insert into publisher(Name,Address,Phone) values
("Ajanta","Hyderabad",9878556789),("R D sharma","Delhi",7896543217),("Pearson","unknown",9876543210);

insert into book(B_id,Title,Author,price,Publisher_name) values
 (15,"The white Tiger","Arvind Adiga",650,"Pearson"),(16,"Machine Learning","Amit kumar das",450,"Ajanta");

insert into Library1(Name,Address) values
("Nalanda Library","Nalanda"),("Ramanthapur Library","Hyderabad");

insert into Borrower(Lib_card,Name,Address,Phone) values
 (18,"Vamshi","New zealand",7894561230),(42,"Daya","England",7894561250);

insert into copies (Book_id,Branch_id,No_of_copies) values
(15,101,4),
(16,102,5);

select * from book;
select b.B_id,b.Title,b.Author,b.price
from book b
join publisher p on b.publisher_name=p.Name;

select publisher_name,count(*)as total_books
from book
group by publisher_name;
select * from Borrower;
 
select * from Borrower where Lib_card=18;
create database ER;

use ER;

create table book(
B_id int primary key,
Title varchar(50),
Author varchar(50),
price varchar(10),
Publisher_name varchar(50),
foreign key (publisher_name) references publisher(name)
);

create table publisher(
Name varchar(50) primary key,
Address varchar(50),
Phone varchar(11) );

create table Library1(
Name varchar(50),
Address varchar (100));

create table Borrower(
Lib_card int primary key,
Name varchar(50),
Address varchar(100),
Phone varchar(11) );

create table copies(
Book_id int,
Branch_id int,
No_of_copies int,
foreign key(Book_id) references book(B_id));

insert into publisher(Name,Address,Phone) values
("Ajanta","Hyderabad",9878556789),("R D sharma","Delhi",7896543217),("Pearson","unknown",9876543210);

insert into book(B_id,Title,Author,price,Publisher_name) values
 (15,"The white Tiger","Arvind Adiga",650,"Pearson"),(16,"Machine Learning","Amit kumar das",450,"Ajanta");

insert into Library1(Name,Address) values
("Nalanda Library","Nalanda"),("Ramanthapur Library","Hyderabad");

insert into Borrower(Lib_card,Name,Address,Phone) values
 (18,"Vamshi","New zealand",7894561230),(42,"Daya","England",7894561250);

insert into copies (Book_id,Branch_id,No_of_copies) values
(15,101,4),
(16,102,5);

select * from book;
select b.B_id,b.Title,b.Author,b.price
from book b
join publisher p on b.publisher_name=p.Name;

select publisher_name,count(*)as total_books
from book
group by publisher_name;
select * from Borrower;
 
select * from Borrower where Lib_card=18;



-- Creating 1nf Table--
create database college;  
use college;
create Table std_enroll(
std_id int,
name varchar(50),
CourseID int,
CourseName varchar(50),
InstructorID int,
InstructorName Varchar(50));

insert into std_enroll(std_id,Name,CourseID,courseName,InstructorID,InstructorName)
values(1,'Sakshi',101,'AIPA',10,'Shailesh'),
(2,'Daya',102,'CSA',11,'Pramod sir'),
(3,'Varun',103,'CHNM',12,'Adarsh'),
(4,'Divakar',104,'Drone',13,'Mahesh');

select * from std_Enroll;

create Table student1(
studentID int,
studentName Varchar(50));

insert into student1(studentID,studentName) values
(1,'Sakshi'),
(2,'Daya'),
(3,'Varun'),
(4,'Divakar');

select * from student1;

create table course(
CourseID int primary key,
courseName varchar(100),
InstructorID int);

insert into course (CourseID,CourseName) values
(1,'AIPA'),
(2,'CSA'),
(3,'CHNM'),
(4,'Drone');

create table Admission(
studentID int,
CourseID int,
Primary key (studentID,courseID));

insert into Admission(StudentID,courseID) values
(1,101),
(2,102),
(3,103),
(4,104);

select * from student1;
select * from Course;
select * from Admission;

-------------- BENF------------ 

create table student2(
StudentID int primary key,
studentName Varchar(50));

insert into student2( StudentID,studentName) values
(1,'Sakshi'),(2,'Daya'),(3,'Varun'),(4,'Divakar');

create table Instructors(
InstructorID int primary key,
InstructorName varchar (50));
 
insert into Instructors (InstructorID,InstructorName) values 
(10,"Shailesh"),
(11,"Pramod Sir"),
(12,"Adharsh"),
(13,"Rakesh");
 
create table Courses(
CourseID int primary key,
CourseName varchar(50),
InstructorID int,
foreign key(InstructorID) references Instructors(InstructorID));
 
insert into Courses( CourseID,CourseName,InstructorID) values 
(101,"AIPA",10),
(102,"CSA",11),
(103,"CHNM",12),
(104,"Drone",13);
 
-- creating relation between StudentsID & Course ID
 
create table Admission1 (
StudentID int,
CourseID int,
primary key (StudentID,CourseID),
foreign key (StudentID) references student2(StudentID),
foreign key (CourseID) references Courses(CourseID));
 
insert into Admission1 (StudentID,CourseID) values 
(1,101),
(2,102),
(3,103),
(4,104);


-- SQL JOINS--

create database sqljoins;

use sqljoins;

create table Employees(
Emp_ID int,
Name varchar(50),
DepartmentID int,
salary int);

insert into Employees(Emp_ID,Name,DepartmentID,salary) values
(1,'Ramesh',101,100000),
(2,'Daya',102,200000),
(3,'Varun',103,300000),
(4,'Koushik',104,3500000);

create table Empolyees2(
Emp_ID int,
Name Varchar(50),
DepartmentName varchar(50),
Salary int);
 

insert into Empolyees2 (Emp_ID,Name,DepartmentName,Salary) values 
(1,'Ramesh','HR',100000),
(2,'Daya','HR',200000),
(3,'Varun','Admin',300000),
(4,'Koushik','Admin',350000),
(5,'Vamshi','Engineer',400000),
(6,'Aadil','Sales',700000),
(7,'Koushik','Finance',800000)
;

select * from Employees;

-- Create Another Table--

create table Department(
DepID int,
DepName varchar(50));

insert into Department(DepID,DepName) values
(102,"Admin"),(101,"HR"),(104,"Sales");

-- Inner Join--

select Emp.Name, Emp.salary,D.DepName from Employees Emp  
inner join Department D on Emp.DepartmentID=D.DepID;

select * from Employees;
select * from Department;

select Emp.Name, Emp.salary,D.DepName from Employees Emp
left join Department D on Emp.DepartmentID=D.DepID;

select Emp.Name, Emp.salary,D.DepName from Employees Emp
Right join Department D on Emp.DepartmentID=D.DepID;

-- Full Join--

-- select Emp.Name, E-- mp.salary,D.DepName from Employees Emp
-- -- full join Department D on Emp.DepartmentID=D.DepID;
use sqljoins;
-- Cross join --
select Emp.Name,Emp.salary,D.DepName from Employees Emp cross join Department D;

-- Self join--
select A.name, A.salary, B.name, B.salary
from Empolyees2 A
join Empolyees2 B
on A.DepartmentName=B.DepartmentName and A.Emp_ID<B.Emp_ID

