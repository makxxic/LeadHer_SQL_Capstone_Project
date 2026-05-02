#  Orion Data Systems Workforce Analytics (SQL Capstone)
### Scenario
```
### Organization Profile
Orion Data Systems, headquartered in San Francisco, USA, is a multinational consulting and technology firm with offices across Europe, Asia, and the Americas. The company employs thousands of professionals across multiple departments and job roles.
The HR & Strategy team needs insights from their workforce database to support decision-making. You have been assigned as a Junior Data Analyst to answer the following business questions using SQL.
```
##  Project Overview
This project analyzes workforce data for Orion Data Systems, a multinational consulting and technology firm, to generate actionable HR and business insights using SQL (MySQL).

The goal is to support HR & Strategy teams in making data-driven decisions around workforce distribution, compensation, and organizational structure.

---

##  Business Questions Solved
This project answers 10 key business questions:

1. Workforce distribution across departments  
2. Average salary comparison by department  
3. Employee salary segmentation (Low, Medium, High)  
4. Department distribution across countries  
5. Identification of high-earning employees  
6. Department leadership and team size  
7. Job role salary analysis  
8. Employee ranking within departments  
9. Total salary cost by country  
10. Identification of unassigned job roles  

---

##  Tools & Technologies
- SQL (MySQL)
- Relational Database Concepts
- Data Aggregation & Window Functions

---

##  Dataset Description
The dataset consists of four tables:

- **employees**: employee details including (employee_id, emp_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_name, department_id, country_id)
- **departments**:  (department_id, department_name, manager_id, location_id)  
- **jobs**: (job_id, job_title, min_salary, max_salary) 
- **countries**: (country_id, country_name, region)  
---

##  Key Insights
- Certain departments dominate workforce size, indicating operational priorities  
- Significant salary disparities exist across departments  
- A portion of employees earn above company average → potential top performers  
- Some job roles currently have **zero employees**, indicating hiring gaps  
- Salary expenditure is concentrated in specific countries  

---

##  Sample SQL Techniques Used
- JOINs (INNER, LEFT)
- GROUP BY & Aggregations (COUNT, AVG, SUM)
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions (ROW_NUMBER)
- CASE statements

---

##  How to Run This Project
1. Create schema:
   ```sql
   CREATE SCHEMA capstone;
   USE capstone;
   ```
2. Import CSV files into MySQL tables
3. Run the SQL script:
``` sql/immaculate_njeri_wk6.sql ```

## Future Improvements
- Build a Power BI or Tableau dashboard on top of this dataset
- Add time-based analysis (hiring trends, salary growth over time)
- Introduce predictive analytics (attrition or salary forecasting)

 ### Author
Immaculate Chege
Aspiring Data Analyst | Machine Learning |Data Scientist | SQL | Data Visualization 

   
