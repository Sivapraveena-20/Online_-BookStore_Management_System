-- To display Books price above the average price:
SELECT Title FROM Books 
WHERE Price > (SELECT AVG(Price) FROM Books);

-- To display Books never sold:
SELECT Book_id, Title FROM Books
WHERE Book_id NOT IN (SELECT Book_id FROM Order_details);

-- To display the customer who spent the most
SELECT Customer_id, Customer_name
FROM Customers
WHERE Customer_id = (
    SELECT Customer_id FROM Orders 
    GROUP BY Customer_id
    ORDER BY SUM(Total_amount) DESC
    LIMIT 1
);

-- to display books more than the average price
SELECT Title, Price
FROM Books
WHERE Price > (
    SELECT AVG(Price)
    FROM Books
);