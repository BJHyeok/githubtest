create table member(
    memberid varchar(50) primary key,
    name varchar(50) not null,
    password varchar(50) not null);

--board
create table article (
    article_no number primary key,
    writer_id varchar(50) not null,
    writer_name varchar(50) not null,
    title varchar(255) not null,
    regdate date not null,
    moddate date not null,
    read_cnt number
    );

--board content
create table article_content(
    article_no number primary key,
    content clob);
    
--employee 
create table emp (
    emp_no varchar(50) primary key,
    classify varchar(50) not null,
    emp_name varchar(50) not null,
    dept varchar(50) not null,
    position varchar(50) not null
    );

--employee info
create table employeeinfo(
    emp_no varchar(50) primary key,
    join_date date not null,
    resign_date date,
    resident_no varchar(50) not null,
    phone varchar(50),
    email varchar(50)
    );

--employee salery
create table salary(
    emp_no varchar(50) primary key,
    wage_date date not null);

-- employee salary item
create table salary_item(
    emp_no varchar(50) primary key,
    base_pay number not null,
    food number not null,
    duty_charge number not null,
    transport number not null,
    bonus number not null);

select * from salary_item where emp_no='1000';


--sample data
insert into emp values(
    '1001',
    '정규직',
    '김길동',
    '개발팀',
    '대리');
    
insert into employeeinfo values (
    '1001',
    '2020-03-07',
    '',
    '123456-1234568',
    '010-1111-2222',
    'hong1@a.com');

insert into salary values(
    '1001',
    '2020-05-07');
    
insert into salary_item values(
    '1001',
    2000000,
    300000,
    100000,
    50000,
    200000);
    
    
--Employee join
select emp.*, employeeinfo.* 
from emp
join employeeinfo
on emp.emp_no = employeeinfo.emp_no;

--Salary join
select emp.*, salary.wage_date, salary.wages
from emp
join salary
on emp.emp_no = salary.emp_no;

--Employee page
select * from(
select rownum rnum, n.* 
from (select * 
from emp e 
join employeeinfo ei
on e.emp_no = ei.emp_no
order by e.emp_no desc) n)
where rnum between 1 and 5; 

--Salary page
select * from(
select rownum rnum, n.* 
from (select e.*, s.wage_date, s.wages
from emp e
join salary s
on e.emp_no = s.emp_no
order by e.emp_no desc) n)
where rnum between 1 and 5; 


-- Employee count
select count(*) from
(select * 
from emp e 
join employeeinfo ei
on e.emp_no = ei.emp_no
order by e.emp_no desc);

-- Salary count
select count(*) from
(select e.*, s.wage_date
from emp e
join salary s
on e.emp_no = s.emp_no
order by e.emp_no desc);

--Working Select
select * from(
select rownum rnum, a.* 
from (select * from emp order by emp_no desc) a)
where rnum between 1 and 5; 

select count(*) from emp;

select * from employeeinfo;