-- Data Analysis
-- details of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no;

-- employees who were hired in 1986
SELECT first_name, last_name
FROM employees
WHERE hire_date>= '1/1/86' AND hire_date <= '12/31/86'

-- information of manager of each department
SELECT dept_manager.dept_no, dept.dept_name, dept_manager.emp_no, e.last_name, e.first_name,   
dept_manager.from_date, dept_manager.to_date
FROM employees e
INNER JOIN dept_manager
ON dept_manager.emp_no = e.emp_no
INNER JOIN dept
ON dept.dept_no = dept_manager.dept_no;

-- information of each employee 
SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees e
INNER JOIN dept_emp
ON dept_emp.emp_no = e.emp_no
INNER JOIN dept
ON dept.dept_no = dept_emp.dept_no;

-- all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name , last_name 
FROM employees e
WHERE first_name = 'Hercules' AND last_name ILIKE 'B%';

-- information of all employees in the Sales department
With sales_dept As
 (
 	SELECT dept_no, dept_name
	FROM dept
	WHERE dept_name = 'Sales'
 ) 
 SELECT 
 	e.emp_no, e.last_name, e.first_name, sales_dept.dept_name
 FROM 
 	employees e
	JOIN dept_emp on dept_emp.emp_no = e.emp_no
	JOIN sales_dept on sales_dept.dept_no = dept_emp.dept_no;

-- information of employees in the Sales and Development departments
With sales_dev_dept As
 (
 	SELECT dept_no, dept_name
	FROM dept
	WHERE dept_name = 'Sales' OR dept_name ='Development'
 ) 
 SELECT 
 	e.emp_no, e.last_name, e.first_name, sales_dev_dept.dept_name
 FROM 
 	employees e
	JOIN dept_emp on dept_emp.emp_no = e.emp_no
	JOIN sales_dev_dept on sales_dev_dept.dept_no = dept_emp.dept_no;
	
-- In descending order, list the frequency count of employee last names, 
SELECT last_name, COUNT (last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
