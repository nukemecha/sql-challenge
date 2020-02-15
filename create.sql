CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(24) NOT NULL,
	last_name VARCHAR (24) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(24) NOT NULL
);

CREATE TABLE dept_emp(
	emp_no INT REFERENCES employees(emp_no),
	dept_no VARCHAR(4) REFERENCES departments(dept_no),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY REFERENCES employees(emp_no),
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE 
);

CREATE TABLE titles(
	emp_no INT REFERENCES employees(emp_no),
	title VARCHAR(24) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE
);

ALTER TABLE titles
ADD id SERIAL PRIMARY KEY;


CREATE TABLE dept_manager(
	dept_no VARCHAR(4) REFERENCES departments(dept_no),
	emp_no INT REFERENCES employees(emp_no),
	from_date DATE NOT NULL,
	to_date DATE,
	PRIMARY KEY (emp_no, dept_no)
);