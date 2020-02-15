-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

SELECT (e.emp_no, e.last_name, e.first_name, e.gender, s.salary)
FROM employees e
INNER JOIN salaries s
ON (e.emp_no = s.emp_no)

-- List employees who were hired in 1986.

SELECT (e.emp_no, e.last_name, e.first_name, e.hire_date)
FROM employees e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.

SELECT (d.dept_no, n.dept_name, d.emp_no, e.last_name, e.first_name, d.from_date, d.to_date)
FROM dept_manager d 
INNER JOIN departments n 
ON (d.dept_no = n.dept_no)
INNER JOIN employees e
ON (d.emp_no = e.emp_no)

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT (d.emp_no, e.last_name, e.first_name, n.dept_name)
FROM dept_emp d 
INNER JOIN employees e 
ON (d.emp_no = e.emp_no)
INNER JOIN departments n 
ON (d.dept_no = n.dept_no)

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees 
WHERE first_name = 'Hercules' AND
last_name LIKE 'B%'

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT (e.emp_no, e.last_name, e.first_name, n.dept_name)
FROM employees e
INNER JOIN dept_emp d 
ON (e.emp_no = d.emp_no)
INNER JOIN departments n
ON (d.dept_no = n.dept_no)
WHERE n.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT (e.emp_no, e.last_name, e.first_name, n.dept_name)
FROM employees e
INNER JOIN dept_emp d 
ON (e.emp_no = d.emp_no)
INNER JOIN departments n
ON (d.dept_no = n.dept_no)
WHERE n.dept_name = 'Sales' OR n.dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS nameCount
FROM employees
GROUP BY last_name
ORDER BY nameCount DESC