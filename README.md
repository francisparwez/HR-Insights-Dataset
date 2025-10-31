# 🧠 10-Day Intermediate SQL Data Science Challenge — HR Analytics Edition

Welcome to the **10-Day HR SQL Data Science Challenge**!  
This challenge uses a realistic **HR database** (similar to the [Employees dataset](https://dev.mysql.com/doc/employee/en/)) to practice SQL for **data analysis, business insights, and HR analytics**.

You’ll work through **100 SQL queries** over 10 days — gradually progressing from basics to analytical functions, subqueries, and CTEs.  
By the end, you’ll be fluent in writing queries that drive **data-driven HR decisions**.

---

## 📊 Assumed Database Schema

| Table | Description |
|:------|:-------------|
| `employees(emp_no, first_name, last_name, gender, birth_date, hire_date)` | Employee master table |
| `departments(dept_no, dept_name)` | Company departments |
| `dept_emp(emp_no, dept_no, from_date, to_date)` | Employee department history |
| `dept_manager(emp_no, dept_no, from_date, to_date)` | Department managers |
| `titles(emp_no, title, from_date, to_date)` | Employee title history |
| `salaries(emp_no, salary, from_date, to_date)` | Employee salary history |

---

## 🗓️ Day 1 – Employee & Department Basics

1. List all employees with their full names (concatenate first and last names).  
2. Find how many employees are currently or were ever in each department.  
3. Show the earliest and latest hire dates in the company.  
4. Get all employees hired before 2010.  
5. Count total employees by gender.  
6. Find the top 3 departments with the most employees.  
7. List employees who worked in the “Sales” department.  
8. Show distinct job titles in the company.  
9. Find employees who are department managers.  
10. Get all employees who joined after 2018 along with their departments.

---

## 🗓️ Day 2 – Aggregation & Grouping

1. Calculate the average salary by department.  
2. Find the highest salary in each department.  
3. Find the total payroll cost (sum of all salaries).  
4. Count how many employees hold each title.  
5. Find the average salary difference between male and female employees.  
6. Show departments with more than 5 employees.  
7. Calculate the average tenure (years between hire_date and to_date in `dept_emp`).  
8. Find the department with the longest-serving manager.  
9. Find how many employees have salaries above 90,000.  
10. List the top 5 highest-paid employees.

---

## 🗓️ Day 3 – Joins for Insight

1. Join employees with departments to display each employee’s department name.  
2. Show each manager’s full name, department, and the period they managed it.  
3. Display employee name, title, and department name together.  
4. Show the total number of employees per department along with manager name.  
5. Find all employees who worked under “Maria Garcia” (if she was a manager).  
6. Get each employee’s title history and salary side-by-side.  
7. Find employees whose salary is higher than their department’s average salary.  
8. List departments and the average salary of their managers.  
9. Show all employees and indicate if they were ever a manager (Yes/No).  
10. Find all employees who moved between multiple departments (worked in >1 dept).

---

## 🗓️ Day 4 – Subqueries Practice

1. List employees whose salary is above the company average.  
2. Find departments with average salary above the overall company average.  
3. Get the employee(s) with the highest salary in each department.  
4. Find the youngest employee in each department.  
5. Show employees hired before the average hire date.  
6. Get all employees who earn more than their department manager.  
7. Find employees who have the same title as at least one manager.  
8. List employees who have salaries within 10% of the company maximum.  
9. Find the top 5% of salaries in the company.  
10. Get all employees whose title changed over time.

---

## 🗓️ Day 5 – Date & Time Analysis

1. Calculate each employee’s age based on `birth_date`.  
2. Find the average age at hiring for all employees.  
3. Find how many employees were hired each year.  
4. Identify hiring trends by decade (2000s, 2010s, 2020s).  
5. Find how long (in years) each employee worked in their department.  
6. Get employees who worked more than 8 years in the same department.  
7. Find the tenure of each manager (`to_date - from_date`).  
8. List employees who left before 2015.  
9. Find employees whose hire_date falls on a weekend.  
10. Show how many employees joined in each quarter (Q1–Q4).

---

## 🗓️ Day 6 – Window Functions

1. Rank employees by salary within each department.  
2. Show each employee’s salary compared to the department average.  
3. Calculate running total of salaries ordered by `hire_date`.  
4. Find the percentage of total salary contributed by each employee.  
5. Rank departments by total payroll cost.  
6. Show each employee’s salary difference from the department’s max salary.  
7. Use `ROW_NUMBER()` to show the latest hire in each department.  
8. Compute cumulative count of employees hired over time.  
9. Rank employees company-wide by years of service.  
10. Find top 3 highest earners in each department.

---

## 🗓️ Day 7 – CTEs (Common Table Expressions)

1. Use a CTE to find departments with average salary > company average.  
2. Create a CTE that finds the most recent manager for each department.  
3. Build a CTE showing each employee’s total years of experience.  
4. Use a CTE to list employees who changed departments.  
5. Use a CTE to find employees with more than one title history.  
6. Build a CTE ranking employees by salary, then filter top 10%.  
7. Create a CTE showing tenure buckets: `<5 yrs`, `5–10 yrs`, `10+ yrs`.  
8. Combine multiple CTEs to show gender ratio and average salary by department.  
9. Use a recursive CTE to count years between `hire_date` and `to_date`.  
10. Use a CTE to list departments sorted by average salary growth.

---

## 🗓️ Day 8 – HR Analytics Insights

1. Calculate gender distribution per department.  
2. Find departments with the youngest average employee.  
3. Identify departments with the highest turnover rate (based on `to_date`).  
4. Find which department hires most frequently after 2015.  
5. Identify employees who were promoted (title changed).  
6. Find the correlation between tenure and salary (approximate via averages).  
7. Determine which departments give the highest salary raises over time.  
8. Calculate average salary by title.  
9. Find which departments have the widest salary range (`max - min`).  
10. Show which departments lost the most employees in the past 10 years.

---

## 🗓️ Day 9 – Advanced Filtering & Conditions

1. Find employees whose last name starts with “M”.  
2. Show employees with salary between 70,000 and 90,000.  
3. List employees in IT or Research departments earning >85,000.  
4. Find employees hired before 2010 who still worked after 2020.  
5. List employees who are not managers and not in Finance.  
6. Find female employees with salary above the overall male average.  
7. Get all employees with titles containing “Manager”.  
8. List employees who have worked in “Customer Support” or “Sales”.  
9. Find employees whose tenure is longer than the company average.  
10. Find employees whose salary increased over time (if multiple salary records exist).

---

## 🗓️ Day 10 – Data Science Case Study: HR Insights

1. Calculate employee churn rate (`employees who left / total employees`).  
2. Find departments with highest average tenure.  
3. Compute gender pay gap per department (`avg male – avg female salary`).  
4. Identify employees with rapid promotions (title changes in <3 years).  
5. Show salary progression trends by department over years.  
6. Identify departments with consistently above-average salaries.  
7. Calculate average salary by birth decade (70s, 80s, 90s).  
8. Show the retention rate of employees hired since 2010.  
9. Find correlation proxy: average age vs average salary per department.  
10. Create a “Top Performers” list: top 10% salary earners by tenure.

---

## 🧩 How to Use This Challenge

- Attempt each query before checking any references.  
- Run queries in **MySQL** (recommended) or **PostgreSQL**.  
- Create a notebook or Markdown file (`Day_1_Solutions.sql`, `Day_2_Solutions.sql`, etc.) to track your progress.  
- Push daily solutions to your GitHub repo — show consistent growth!

---

## 🏁 Progress Tracker

| Day | Focus Area | Status |
|:----|:------------|:-------|
| 1 | Employee Basics | ⬜ |
| 2 | Aggregations | ⬜ |
| 3 | Joins | ⬜ |
| 4 | Subqueries | ⬜ |
| 5 | Date & Time | ⬜ |
| 6 | Window Functions | ⬜ |
| 7 | CTEs | ⬜ |
| 8 | HR Insights | ⬜ |
| 9 | Advanced Filtering | ⬜ |
| 10 | HR Data Science Case Study | ⬜ |

---

### 🧠 Pro Tip:
Once you complete this challenge, apply your queries to:
- **Visualize HR insights** (using Power BI, Tableau, or Python)
- **Build a mini HR analytics dashboard**
- **Showcase your SQL + Data Science workflow**

---

### 🧰 License
Feel free to fork, use, or adapt this challenge for learning.  
Attribution appreciated:  
`Created by [Your Name] | HR SQL Data Science Challenge`
