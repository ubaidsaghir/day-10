CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salary NUMERIC(10,2) CHECK (salary > 0),
    hire_date DATE DEFAULT CURRENT_DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_name)
VALUES ('IT'), ('HR'), ('Finance');


INSERT INTO employees (first_name, last_name, email, salary, dept_id)
VALUES
('Ali','Khan','ali@gmail.com',80000,1),
('Awais','Aamir','sara@gmail.com',60000,2),
('Ubaid','Saghir','ubaid@gmail.com',90000,1),
('Hassan','Raza','hassan@gmail.com',50000,3),
('Ahmad','Malik','ayesha@gmail.com',75000,2);

SELECT * FROM employees
WHERE salary > 70000;

SELECT * FROM employees
WHERE salary BETWEEN 60000 AND 85000;

SELECT * FROM employees
WHERE dept_id IN (1,2);

SELECT DISTINCT dept_id FROM employees;


SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;

SELECT COUNT(*) FROM employees;

SELECT AVG(salary) FROM employees;


SELECT dept_id, ROUND(AVG(salary),2)
FROM employees
GROUP BY dept_id;

SELECT 
first_name,
salary,
CASE
    WHEN salary > 80000 THEN 'High'
    WHEN salary BETWEEN 60000 AND 80000 THEN 'Medium'
    ELSE 'Low'
END AS salary_category
FROM employees;


SELECT 
CONCAT(first_name,' ',last_name) AS full_name,
UPPER(first_name),
LOWER(last_name),
LENGTH(email)
FROM employees;

SELECT 
first_name,
salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

WITH high_salary AS (
    SELECT * FROM employees
    WHERE salary > 70000
)
SELECT COUNT(*) FROM high_salary;

