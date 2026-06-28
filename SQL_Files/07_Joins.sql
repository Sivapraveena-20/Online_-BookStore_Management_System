-- All orders with customer names
--    (Only customers who have placed orders appear)
SELECT
    C.Customer_name,
    O.Order_id,
    O.Order_date,
    O.Total_amount,
    O.Status
FROM Customers C
INNER JOIN Orders O
    ON C.Customer_id = O.Customer_id;

-- Books with their publisher names
SELECT
    B.Book_id,
    B.Title,
    B.Author,
    P.Publisher_name,
    B.Price,
    B.Category
FROM Books B
INNER JOIN Publishers P
    ON B.Publisher_id = P.Publisher_id;

--  Orders handled by which employee
SELECT
    O.Order_id,
    O.Order_date,
    C.Customer_name,
    E.Employee_name,
    E.Role,
    O.Total_amount,
    O.Status
FROM Orders O
INNER JOIN Customers C
    ON O.Customer_id = C.Customer_id
INNER JOIN Employees E
    ON O.Employee_id = E.Employee_id;

--  Payment details with order and customer info
SELECT
    P.Payment_id,
    C.Customer_name,
    O.Order_date,
    P.Payment_date,
    P.Amount,
    P.Payment_status,
    P.Transaction_id
FROM Payments P
INNER JOIN Orders O
    ON P.Order_id = O.Order_id
INNER JOIN Customers C
    ON O.Customer_id = C.Customer_id;

-- LEFT JOIN
-- All customers and their orders
--    (Customers with NO orders will also appear with NULL order values)
SELECT
    C.Customer_id,
    C.Customer_name,
    O.Order_id,
    O.Order_date,
    O.Total_amount,
    O.Status
FROM Customers C
LEFT JOIN Orders O
    ON C.Customer_id = O.Customer_id;

-- Find customers who have NEVER placed an order
SELECT
    C.Customer_id,
    C.Customer_name,
    C.Customer_email
FROM Customers C
LEFT JOIN Orders O
    ON C.Customer_id = O.Customer_id
WHERE O.Order_id IS NULL;

-- All books, including ones that have never been ordered
SELECT
    B.Book_id,
    B.Title,
    B.Author,
    OD.Order_id,
    OD.Quantity
FROM Books B
LEFT JOIN Order_Details OD
    ON B.Book_id = OD.Book_id;

--  Inventory details with supplier names

SELECT
    B.Title,
    S.Supplier_name,
    I.Quantity_in_stock,
    I.Cost_price,
    I.Last_restock_date
FROM Inventory I
LEFT JOIN Books B
    ON I.Book_id = B.Book_id
LEFT JOIN Suppliers S
    ON I.Supplier_id = S.Supplier_id;


-- RIGHT JOIN

-- All orders and their payments
SELECT
    O.Order_id,
    O.Order_date,
    O.Total_amount,
    O.Status,
    P.Payment_id,
    P.Payment_status,
    P.Transaction_id
FROM Payments P
RIGHT JOIN Orders O
    ON P.Order_id = O.Order_id;

--  All employees and the orders they handled
SELECT
    E.Employee_id,
    E.Employee_name,
    E.Role,
    O.Order_id,
    O.Order_date,
    O.Status
FROM Orders O
RIGHT JOIN Employees E
    ON O.Employee_id = E.Employee_id;
