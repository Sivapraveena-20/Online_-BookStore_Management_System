INSERT INTO Publishers
(Publisher_name, Publisher_email, Publisher_phone, Publisher_address)
VALUES
('Penguin Random House','contact@penguin.com','9876543201','New York, USA'),
('HarperCollins','support@harpercollins.com','9876543202','London, UK'),
('Oxford University Press','info@oup.com','9876543203','Oxford, UK'),
('Pearson Education','help@pearson.com','9876543204','London, UK'),
('McGraw Hill','contact@mcgrawhill.com','9876543205','New York, USA');

INSERT INTO Books
(Title, Author, Publisher_id, Price, Published_Year, Category)
VALUES
('The Alchemist','Paulo Coelho',1,399.00,1988,'Fiction'),
('Atomic Habits','James Clear',2,699.00,2018,'Self Help'),
('Clean Code','Robert C. Martin',4,899.00,2008,'Programming'),
('Introduction to Algorithms','Thomas H. Cormen',5,1299.00,2009,'Computer Science'),
('Harry Potter and the Philosopher''s Stone','J.K. Rowling',1,599.00,1997,'Fantasy'),
('Rich Dad Poor Dad','Robert Kiyosaki',2,499.00,1997,'Finance'),
('Data Structures Using C','Reema Thareja',4,750.00,2012,'Programming'),
('Python Crash Course','Eric Matthes',4,950.00,2019,'Programming');

INSERT INTO Customers
(Customer_name, Customer_email, Customer_phone, Address)
VALUES
('Shiv','shivvv@gmail.com','7988667701','Chennai'),
('Priya','priya@gmail.com','9876500002','Chennai'),
('Atchaya','atchaya@gmail.com','9876500003','Bengaluru'),
('Suba','suba@gmail.com','9876500004','Ahmedabad'),
('Rahul','rahul@gmail.com','9876500001','Mumbai'),
('Shanmi','shanmi@gmail.com','9787098210','Chennai'),
('Alvi','alvi@gmail.com','9876500005','Delhi');


INSERT INTO Suppliers
(Supplier_name, Contact_person, Supplier_phone, Supplier_email, Supplier_address)
VALUES
('ABC Book Distributors','Amit','9123456781','abc@suppliers.com','Mumbai'),
('National Book Supply','Rakesh','9123456782','national@suppliers.com','Delhi'),
('Global Book House','Priya','9123456783','global@suppliers.com','Chennai'),
('Knowledge Suppliers','Kumar','9123456784','knowledge@suppliers.com','Hyderabad'),
('EduBooks Pvt Ltd','Sneha','9123456785','edubooks@suppliers.com','Pune');

INSERT INTO Employees
(Employee_name, Employee_email, Employee_phone, Role, Salary, Hire_date)
VALUES
('Sharma', 'sharma@bookstore.com', '9876543210', 'Store Manager', 65000.00, '2023-01-15'),
('Preethu', 'preethu@bookstore.com', '9876543211', 'Cashier', 32000.00, '2023-03-20'),
('Arjun Kumar', 'arjunkumar@bookstore.com', '9876543212', 'Sales Executive', 35000.00, '2023-05-10'),
('Sneha', 'sneha@bookstore.com', '9876543213', 'Inventory Manager', 42000.00, '2023-07-18'),
('Kiran', 'kiran@bookstore.com', '9876543214', 'Sales Executive', 36000.00, '2023-09-12'),
('Sam', 'sam@bookstore.com', '9876543215', 'Cashier', 33000.00, '2024-01-08'),
('Vikram', 'vikram@bookstore.com', '9876543216', 'Store Assistant', 28000.00, '2024-02-14'),
('Anitha', 'anitha@bookstore.com', '9876543217', 'Customer Support', 30000.00, '2024-04-01'),
('Joe', 'joe@bookstore.com', '9876543218', 'Sales Executive', 37000.00, '2024-06-05'),
('Pooja', 'pooja@bookstore.com', '9876543219', 'Customer Support', 30000.00, '2024-08-20');

INSERT INTO Orders
(Order_date, Customer_id, Employee_id, Total_amount, Status)
VALUES
('2026-06-20',1,2,1098.00,'Completed'),
('2026-06-21',2,3,1299.00,'Completed'),
('2026-06-22',3,5,1598.00,'Pending'),
('2026-06-23',4,2,699.00,'Completed'),
('2026-06-24',5,3,950.00,'Cancelled'),
('2026-06-25',6,1,950.00,'Pending');

INSERT INTO Order_Details
(Order_id, Book_id, Quantity, Subtotal)
VALUES
(1,2,1,699.00),
(1,6,1,399.00),
(2,4,1,1299.00),
(3,5,2,1198.00),
(3,1,1,400.00),
(4,2,1,699.00),
(5,8,1,950.00),
(6,2,1,699.00);

INSERT INTO Payments
(Order_id, Payment_date, Amount, Payment_status, Transaction_id)
VALUES
(1,'2026-06-20',1098.00,'Paid','TXN100001'),
(2,'2026-06-21',1299.00,'Paid','TXN100002'),
(3,'2026-06-22',1598.00,'Pending','TXN100003'),
(4,'2026-06-23',699.00,'Paid','TXN100004'),
(5,'2026-06-24',950.00,'Refunded','TXN100005'),
(6,'2026-06-25',699.00,'Pending','TXN100006');

INSERT INTO Inventory
(Book_id, Supplier_id, Quantity_in_stock, Last_restock_date, Cost_price)
VALUES
(1,1,40,'2026-06-10',250.00),
(2,2,35,'2026-06-12',450.00),
(3,3,20,'2026-06-14',650.00),
(4,4,15,'2026-06-15',950.00),
(5,1,50,'2026-06-16',380.00),
(6,5,30,'2026-06-18',320.00),
(7,2,18,'2026-06-19',500.00),
(8,3,22,'2026-06-20',700.00);

-- To display all the tables-- 

SELECT * FROM Publishers;
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Suppliers;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM Order_Details;
SELECT * FROM Payments;
SELECT * FROM Inventory;