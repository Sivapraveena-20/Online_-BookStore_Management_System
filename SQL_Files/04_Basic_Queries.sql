-- To display all the rows and columns from the table name Books 
SELECT * FROM BOOKS;

-- To display all the rows and columns of the table customers
SELECT * FROM Customers;

-- Display the books of which price is more than 800
SELECT Title 
FROM Books 
WHERE Price > 800;

-- Displays all the rows and columns where Order_ date is change to descending order
SELECT * FROM Orders ORDER BY Order_date DESC;

-- Display only 3 customers 
SELECT * FROM Customers LIMIT 3;

-- Display employee id, name were their salary is more than 40000
SELECT Employee_id , Employee_name
FROM Employees
WHERE Salary >= 40000;

-- To display only the pending orders from Orders table
SELECT Order_id, Customer_id FROM Orders
WHERE Status ='Pending';

-- TO dislay books price in descending order
SELECT * FROM Books ORDER BY Price DESC;