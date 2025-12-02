-- 1. Join employees with departments to display each employee’s department name.

SELECT
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.dept_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no;

-- 2. Show each manager’s full name, department, and the period they managed it.

SELECT
    d.dept_name AS department,
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    dm.from_date AS start_date,
    dm.to_date AS end_date,
    CONCAT(
        FLOOR(DATEDIFF(dm.to_date, dm.from_date) / 365.25), ' Years, ',
        FLOOR((DATEDIFF(dm.to_date, dm.from_date) % 365.25) / 30.44), ' Months, ',
        FLOOR((DATEDIFF(dm.to_date, dm.from_date) % 30.44)), ' Days'
    ) AS time_managed
FROM
    employees e
JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
JOIN
    departments d ON dm.dept_no = d.dept_no;

-- 3. Display employee name, title, and department name together.

SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    ti.title AS employee_title,
    d.dept_name AS department
FROM
    employees e
JOIN titles ti ON e.emp_no = ti.emp_no
JOIN dept_emp de ON ti.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- 4. Show the total number of employees per department along with manager name.

SELECT
    d.dept_name AS department,
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    COUNT(de.emp_no) AS total_employees
FROM
    departments d
JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN
    employees e ON dm.emp_no = e.emp_no
JOIN
    dept_emp de ON dm.dept_no = de.dept_no
GROUP BY
    d.dept_no, manager_name;

-- 5. Find all employees who worked under "John Smith"
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.dept_no IN (
    SELECT dm.dept_no
    FROM dept_manager dm
    JOIN employees m ON dm.emp_no = m.emp_no
    WHERE m.first_name = 'John' AND m.last_name = 'Smith'
);

-- 6. Get each employee’s title history and salary side-by-side.

SELECT
    e.emp_no AS employee_no,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    ti.title AS title,
    ti.from_date AS title_from,
    ti.to_date AS title_to,
    s.salary AS salary,
    s.from_date AS salary_from,
    s.to_date AS salary_to
FROM employees e
JOIN titles ti ON e.emp_no = ti.emp_no
JOIN salaries s ON ti.emp_no = s.emp_no
ORDER BY e.emp_no, ti.from_date;

-- 7. Find employees whose salary is higher than their department’s average salary.

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name,
    s.salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE s.salary > (
    SELECT AVG(s2.salary)
    FROM dept_emp de2
    JOIN salaries s2 ON de2.emp_no = s2.emp_no
    WHERE de2.dept_no = de.dept_no
);

-- 8. List departments and the average salary of their managers.

SELECT 
    d.dept_name,
    ROUND(AVG(s.salary), 0) AS avg_manager_salary
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY d.dept_name;