create database video;
use video;


create table apply(
sID int,
cName varchar(20),
major varchar(20),
decisiom varchar(1)
primary key (sID,cname,major),
foreign key (sID) references student (sID),
foreign key (cname) references college (cname)
);

select * from apply;

create table college(
cName varchar(20),
state varchar(2),
enrollment int
);

select * from college;

create table student(
sID int,
sName varchar(20),
GPA float (20),
sizeHS int
);

select * from student;

drop table student;
drop table college;
drop table apply;

insert into college values 
('Standford','CA',15000),
('Berkeley','CA',36000),
('MIT','MA',10000),
('Cornell','NY',21000);

insert into student values 
(123,'Amy',3.9,1000),
(234,'Bob',3.6,1500),
(345,'Craig',3.5,500),
(456,'Doris',3.9,1000),
(567,'Edward',2.9,2000),
(678,'Fay',3.8,200),
(789,'Gary',3.4,800),
(987,'Helen',3.7,800),
(876,'Irene',3.9,400),
(765,'Jay',2.9,1500),
(654,'Amy',3.9,1000),
(543,'Craig',3.4,2000);

insert into apply values 
(123,'Standford','CS','V'),
(123,'Standford','EE','N'),
(123,'Berkeley','CS','Y'),
(123,'Cornell','EE','Y'),
(234,'Berkeley','biology','N'),
(345,'MIT','bioengineering','Y'),
(345,'Cornell','bioengineering','N'),
(345,'Cornell','CS','Y'),
(345,'Cornell','EE','N'),
(678,'Standford','history','Y'),
(987,'Standford','CS','Y'),
(987,'Berkeley','CS','Y'),
(876,'Standford','CS','N'),
(876,'MIT','biology','Y'),
(876,'MIT','marine biology','N'),
(765,'Standford','history','Y'),
(765,'Cornell','history','N'),
(765,'Cornell','psychology','Y'),
(543,'MIT','CS','N');

delete from college;
delete from apply;
delete from student;

select sID,sName,GPA
from student
where GPA >3.6;

select sID,sName
from student
where GPA >3.6;

select sName, major
from student, apply
where student.sID = apply.sID;

select distinct sName, major
from student, apply
where student.sID = apply.sID;

select sName,GPA, decisiom
from student, apply
where student.sID = apply.sID and sizeHS < 1000 and major = 'CS' and cname = 'Standford';

select college.cName
from college, apply
where college.cName = apply.cName and enrollment > 20000 and major ='CS';

select distinct college.cName
from college, apply
where college.cName = apply.cName and enrollment > 20000 and major ='CS';

select student.sID,sname,GPA, apply.cname,enrollment
from student,college,apply
where apply.sID = student.sID and apply.cname = college.cname order by GPA desc, enrollment;

select sID,major
from apply
where major like '%bio%';

select *
from apply
where major like '%bio%';


select * 
from student,college;

select sID,sname,GPA,sizeHS,GPA*(sizeHS/1000) as scaledGPA
from student;








select distinct sName,major
from Student join Apply
on Student.sID = Apply.sID;

select sName,GPA decisiom
from Student join Apply
on Student.sID = Apply.sID
where sizeHS < 1000 and major ='Cs' and cName='Stanford';

select Apply.sID,sName,GPA,Apply.cName,enrollment
from (Apply join Student on Apply.sID=Student.sID) join College
on Apply.cName=College.cName;

select S1.sID,S1.sName,S1.GPA,S2.sID,S2.sName,S2.GPA
from Student S1 join Student S2 using(GPA)
where S1.sID<S2.sID;

select sName,sID,cName,major
from Student full outer join Apply using(sID);

select sName,sId,cName,major
from Student left outer join Apply using(sID)
union
select sNAme,sId,cName,major
from Student right outer join Apply using(sID);

select sName,Student.sID,cName,major
from Student,Apply
where Student.sID=Apply.sID
union
select sName,sID,null,null 
from Student
where sID not in (select sID from Apply)
union
select null,sID,cName,major
from Apply
where sID not in (select sID from Student);


# nombre de los estudiantes que no han realizado ninguna solicitud

select sName,sID,cName,major from Student left outer join Apply using(sID) where sID is not null;

select sName from student join apply on student.sid=apply.sid where apply.sid not in (select sid from apply); 


