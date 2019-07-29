create table department(
	dept_no varchar(4) primary key,
	dept_name varchar(20) not null
);

select * from department;

create table employees(
	emp_no integer primary key,
	birth_date varchar(10),
	first_name varchar(20),
	last_name varchar(20),
	gender varchar(1),
	hire_date varchar(10)
);

create table dept_emp(
	emp_no integer,
	dept_no varchar(4),
	from_date varchar(10),
	to_date varchar(10),
	foreign key(emp_no) references employees(emp_no),
	foreign key(dept_no) references department(dept_no)
);

select * from dept_emp;

create table dept_manager(
	dept_no varchar(4),
	emp_no integer,
	from_date varchar(10),
	to_date varchar(10),
	foreign key(emp_no) references employees(emp_no),
	foreign key(dept_no) references department(dept_no)
);

select * from dept_manager;

create table salaries(
	emp_no integer,
	salary integer,
	from_date varchar(10),
	to_date varchar(10),
	foreign key(emp_no) references employees(emp_no)
);

create table titles(
	emp_no integer,
	title varchar(30),
	from_date varchar(10),
	to_date varchar(10),
	foreign key(emp_no) references employees(emp_no)
);