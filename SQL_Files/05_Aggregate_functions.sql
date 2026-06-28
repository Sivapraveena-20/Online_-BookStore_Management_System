-- Count function: (basic usage)
SELECT COUNT(*) FROM Books;
SELECT COUNT(*) FROM Employees;
SELECT COUNT(*) FROM Orders;

-- Conditional Count:
SELECT COUNT(*) FROM Employees
WHERE Role ='Customer Support';

SELECT COUNT(*) FROM Books
WHERE Category='Programming';

-- Distinct Count: 
SELECT COUNT(DISTINCT Role) From Employees;

-- Basic Sum:
SELECT SUM(Total_amount) From Orders;

-- Conditional Sum:
SELECT SUM(Total_amount) From Orders
WHERE Status ='Pending';

SELECT SUM(Salary) FROM Employees
WHERE Role ='Cashier';

-- Sum using Group by:
SELECT Role, SUM(Salary) FROM Employees GROUP BY Role;

-- Average:
SELECT AVG(Price) FROM Books;
SELECT AVG(Salary) FROM Employees;

-- Conditional Average:
SELECT AVG(Salary) From Employees WHERE Role='Sales Executive';

-- Average using Group by:
SELECT Role, AVG(Salary) FROM Employees GROUP BY Role;

-- Round off using Average:
SELECT Role, ROUND(AVG(Salary),2) FROM Employees GROUP BY Role;

-- Max:
SELECT MAX(Total_Amount) From Orders;

-- Min:
SELECT MIN(Total_Amount) From Orders;

-- Multiple functions in single query:
SELECT COUNT(*), SUM(Salary), AVG(Salary), MAX(Salary), MIN(Salary) FROM Employees;

-- Aggregation with combining Group by , having clauses:
SELECT Role, AVG(Salary) FROM Employees GROUP BY Role HAVING AVG(Salary) > 40000;

SELECT Category , MAX(Price) FROM Books GROUP BY Category HAVING MAX(Price) > 500;