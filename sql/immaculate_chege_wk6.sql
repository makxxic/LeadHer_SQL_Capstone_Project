CREATE SCHEMA IF NOT EXISTS capstone;
USE capstone;

SELECT * FROM countries;
SELECT * FROM jobs;
SELECT * FROM departments;
SELECT * FROM employees;

/* 1. Workforce Distribution
How many employees are in each department, and which department has the highest headcount?
 (Concepts: SELECT, COUNT, GROUP BY, ORDER BY)
*/
SELECT department_id,
COUNT(employee_id) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY employee_count DESC;

/* 2. Salary Comparison
What is the average salary per department, and which department has the highest and lowest average salaries?
 (Concepts: AVG, GROUP BY, ORDER BY, LIMIT)
*/
SELECT department_id,
ROUND(AVG(salary),1) AS avg_salary
FROM employees 
GROUP BY department_id
ORDER BY avg_salary DESC;

/* 3. Salary Bands for Employees
Classify employees into three salary bands using CASE:
Low (<5000), Medium (5000 – 10000), High (>10000)
How many employees fall into each band?
 (Concepts: CASE, COUNT, GROUP BY)
*/
SELECT 
    CASE 
        WHEN salary < 5000 THEN 'Low'
        WHEN salary BETWEEN 5000 AND 10000 THEN 'Medium'
        ELSE 'High'
    END AS salary_band,
COUNT(*) AS employee_count
FROM employees
GROUP BY salary_band; 

/* 4. Country-Level Analysis
List all countries in which Orion Data Systems operates. For each country, show the number of departments located there.
 (Concepts: JOIN, GROUP BY, COUNT)
*/
-- departments.location_id is numeric while countries.country_id is string.
-- There is no direct relationship between these tables in the provided dataset.
-- A locations table is required to correctly map departments to countries.


/* 5. High Earners
Find all employees whose salaries are greater than the company-wide average salary.
 (Concepts: Subquery, AVG, WHERE)
*/
SELECT emp_name
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

/* 6. Department Leaders
List each department along with the manager’s name and the number of employees reporting to that department.
 (Concepts: INNER JOIN, GROUP BY, COUNT)
*/
SELECT d.department_name, e.manager_name,
COUNT(e.employee_id) AS employee_count
FROM departments d
INNER JOIN employees e 
ON d.department_id = e.department_id
GROUP BY d.department_name, e.manager_name;

/* 7. Job Role Analysis
For each job title, calculate the average salary. Then, identify job titles where the average salary is above 12,000.
 (Concepts: CTE, AVG, HAVING)
*/
WITH job_avg_salary AS (
    SELECT j.job_title,
        ROUND(AVG(e.salary),1) AS avg_salary
    FROM employees e
INNER JOIN jobs j 
ON e.job_id = j.job_id
    GROUP BY j.job_title
)
SELECT *
FROM job_avg_salary
WHERE avg_salary > 12000;

-- using HAVING then no CTE
SELECT j.job_title,
ROUND(AVG(e.salary),1) AS avg_salary
FROM employees e
INNER JOIN jobs j 
ON e.job_id = j.job_id
GROUP BY j.job_title
HAVING AVG(e.salary) > 12000;

/* 8. Employee Ranking
Rank employees by salary (highest to lowest) within their department.
 (Concepts: ROW_NUMBER, PARTITION BY, ORDER BY)
*/
SELECT emp_name, department_id, salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
    ) AS rank_in_department
FROM employees
ORDER BY department_id, rank_in_department;

/* 9. Salary Growth Trend
Calculate the total salaries paid to employees in each country. List the country name alongside the total salary cost, ordered from highest to lowest.
(Concepts: JOIN, SUM, GROUP BY, ORDER BY)
*/
SELECT c.country_name,
SUM(e.salary) AS total_salary
FROM employees e
JOIN countries c 
ON e.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_salary DESC;

/* 10. Workforce Gaps
Identify all job roles in the company (jobs table) that currently have no employees assigned.
 (Concepts: RIGHT JOIN, WHERE IS NULL)
*/
SELECT j.job_title
FROM employees e
RIGHT JOIN jobs j 
ON e.job_id = j.job_id
WHERE e.employee_id IS NULL;
-- There are no job roles without employees



