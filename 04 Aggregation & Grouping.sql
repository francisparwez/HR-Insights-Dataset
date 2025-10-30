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
