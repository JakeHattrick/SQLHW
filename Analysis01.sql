/*
1. List the following details of each employee: 
employee number, last name, first name, gender, and salary.
*/
select e.emp_no, e.first_name, e.last_name, e.gender, s.salary 
from employees e
join salaries s
on (e.emp_no = s.emp_no)
order by e.emp_no;

/*
2. List employees who were hired in 1986.
*/
select * from employees
where hire_date like '1986%';

/*
3. List the manager of each department with the following information:
department number, department name, the manager's employee number, last name,
first name, and start and end employment dates.
*/
select m.dept_no, d.dept_name, e.emp_no, e.last_name,e.first_name, m.from_date, m.to_date
from employees e
join dept_manager m
on (e.emp_no = m.emp_no)
join department d
on (m.dept_no = d.dept_no)
where e.emp_no in(
	select max(emp_no) from dept_manager
	group by dept_no
);

/*
4. List the department of each employee with the following information: 
employee number, last name, first name, and department name.
*/

select e.emp_no, e.last_name,e.first_name,d.dept_name
from employees e
join dept_emp
on (e.emp_no = dept_emp.emp_no)
join department d
on (dept_emp.dept_no = d.dept_no)
order by e.emp_no;

/*
5. List all employees whose first name is "Hercules" and last names begin with "B."
*/
select * from employees
where first_name = 'Hercules'
and last_name like 'B%';

/*
6. List all employees in the Sales department, including their
employee number, last name, first name, and department name.
*/

select e.emp_no, e.last_name,e.first_name,d.dept_name
from employees e
join dept_emp
on (e.emp_no = dept_emp.emp_no)
join department d
on (dept_emp.dept_no = d.dept_no)
where d.dept_name = 'Sales'
order by e.emp_no;

/*
7. List all employees in the Sales and Development departments,
including their employee number, last name, first name, and department name.
*/
select e.emp_no, e.last_name,e.first_name,d.dept_name
from employees e
join dept_emp
on (e.emp_no = dept_emp.emp_no)
join department d
on (dept_emp.dept_no = d.dept_no)
where d.dept_name in ('Sales','Development')
order by e.emp_no;

/*
8. In descending order, list the frequency count of employee last names,
i.e., how many employees share each last name.
*/
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;