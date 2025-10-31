-- 1. Calculate the average salary by department.
SELECT 
    d.dept_name AS department,
    ROUND(AVG(s.salary), 1) AS average_salary
FROM
    salaries s
JOIN
    dept_emp de ON s.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
GROUP BY
    d.dept_name
ORDER BY
    average_salary DESC;

-- 2. Find the highest salary in each department.
SELECT
    d.dept_name AS department,
    MAX(s.salary) as highest_salary
FROM
    salaries s
JOIN
    dept_emp de ON s.emp_no = de.emp_no 
JOIN
    departments d ON de.dept_no = d.dept_no
GROUP BY
    d.dept_name
ORDER BY
    highest_salary DESC;

-- 3. Find the total payroll cost (sum of all salaries).

SELECT 
    SUM(salary) AS total_payroll_cost
FROM 
    salaries;

-- 4. Count how many employees hold each title.
SELECT
    title,
    COUNT(e.emp_no) AS number_of_employees
FROM
    titles ti
JOIN
    employees e ON ti.emp_no = e.emp_no
GROUP BY ti.title
ORDER BY number_of_employees DESC;

-- 5. Find the average salary difference between male and female employees.
SELECT
    e.gender AS gender,
    ROUND(AVG(s.salary), 0) AS average_salary
FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;

-- 6. Show departments with more than 5 employees.

SELECT
    d.dept_name,
    COUNT(de.emp_no) AS number_of_employees
FROM
    departments d
JOIN
    dept_emp de ON d.dept_no = de.dept_no
GROUP BY d.dept_name
HAVING number_of_employees > 5;

-- 7. Calculate the average tenure (years between hire_date and to_date in dept_emp).
SELECT 
    d.dept_name AS department,
    ROUND(AVG(TIMESTAMPDIFF(YEAR, de.from_date, de.to_date)), 2) AS avg_tenure_years
FROM 
    dept_emp de
JOIN 
    departments d ON de.dept_no = d.dept_no
GROUP BY 
    d.dept_name
ORDER BY 
    avg_tenure_years DESC;

-- 8. Find the department with the longest-serving manager.

SELECT 
    d.dept_name,
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    CONCAT(
        FLOOR(DATEDIFF(dm.to_date, dm.from_date) / 365.25), ' Years, ',
        FLOOR((DATEDIFF(dm.to_date, dm.from_date) % 365.25) / 30.44), ' Months, ',
        FLOOR((DATEDIFF(dm.to_date, dm.from_date) % 30.44)), ' Days'
    ) AS employment_tenure
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
ORDER BY DATEDIFF(dm.to_date, dm.from_date) DESC
LIMIT 1;

-- 9. Find how many employees have salaries above 90,000.

SELECT
    COUNT(*) AS num_of_emp_over_90000
FROM
    salaries
WHERE
    salary > 90000;

-- 10. List the top 5 highest-paid employees.

SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    s.salary
FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no
ORDER BY s.salary DESC
LIMIT 5;

