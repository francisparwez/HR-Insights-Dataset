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
