-- To display all the customers and their orders
CREATE VIEW Customer_Orders AS
SELECT
    C.Customer_id,
    C.Customer_name,
    O.Order_id,
    O.Order_date,
    O.Total_amount
FROM Customers C
JOIN Orders O
ON C.Customer_id = O.Customer_id;

SELECT * FROM Customer_Orders;

