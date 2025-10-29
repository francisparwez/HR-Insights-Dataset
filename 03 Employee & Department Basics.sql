-- 01 List all employees with their full names 
 
SELECT
	CONCAT(first_name, ' ' , last_name) AS 'full_name'
FROM employees;
 
-- 02 Find how many employees are currently or were ever in each department
 
SELECT
	d.dept_name,
	COUNT(de.emp_no) AS total_employees
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY total_employees DESC;

-- 03 Show the earliest and latest hire dates in the company.

SELECT 
	MIN(hire_date) AS earliest_hire,
	MAX(hire_date) AS latest_hire
FROM employees;

-- 04 Get all employees hired before 2010

SELECT
	emp_no,
	first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date < '2010-01-01'
ORDER BY hire_date;

-- 05 Count total employees by gender

SELECT
	gender,
	COUNT(*)
FROM employees
GROUP BY gender;

-- 06 Find the top 3 departments with the most employees

SELECT
	d.dept_name,
	COUNT(de.emp_no) AS total_employees
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY total_employees DESC
LIMIT 3;

-- 07 List employees who worked in the “Sales” department.

SELECT 
	CONCAT(e.first_name, ' ', e.last_name) AS full_name,
	d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 08 Show distinct job titles in the company

SELECT
	DISTINCT title
FROM titles
ORDER BY title;

-- 09 Find employees who are department managers

SELECT
	e.emp_no,
	CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
	d.dept_name
FROM employees e 
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON dm.dept_no = d.dept_no
ORDER BY d.dept_name;

-- 10 Get all employees who joined after 2018 along with their departments

SELECT
	e.emp_no,
	CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    e.hire_date,
    d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE hire_date >= '2018-01-01'
ORDER BY e.hire_date;
