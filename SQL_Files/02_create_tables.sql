CREATE TABLE Publishers(
    Publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    Publisher_name VARCHAR(150) NOT NULL,
    Publisher_email VARCHAR(255) UNIQUE NOT NULL,
    Publisher_phone VARCHAR(15) UNIQUE NOT NULL,
    Publisher_address VARCHAR(300) NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Books(
    Book_id INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(150) NOT NULL,
    Publisher_id INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Published_Year YEAR,
    Category VARCHAR(100),

    FOREIGN KEY (Publisher_id)
        REFERENCES Publishers(Publisher_id)
);

CREATE TABLE Customers(
    Customer_id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_name VARCHAR(150) NOT NULL,
    Customer_email VARCHAR(255) UNIQUE NOT NULL,
    Customer_phone VARCHAR(15) UNIQUE,
    Address VARCHAR(300),
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Suppliers(
    Supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    Supplier_name VARCHAR(150) NOT NULL,
    Contact_person VARCHAR(150) NOT NULL,
    Supplier_phone VARCHAR(15) UNIQUE NOT NULL,
    Supplier_email VARCHAR(255) UNIQUE NOT NULL,
    Supplier_address VARCHAR(300) NOT NULL
);

CREATE TABLE Employees(
    Employee_id INT PRIMARY KEY AUTO_INCREMENT,
    Employee_name VARCHAR(255) NOT NULL,
    Employee_email VARCHAR(255) UNIQUE NOT NULL,
    Employee_phone VARCHAR(15) UNIQUE NOT NULL,
    Role VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL CHECK (Salary >= 0),
    Hire_date DATE NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders(
    Order_id INT PRIMARY KEY AUTO_INCREMENT,
    Order_date DATE NOT NULL,
    Customer_id INT NOT NULL,
    Employee_id INT NOT NULL,
    Total_amount DECIMAL(10,2) NOT NULL CHECK (Total_amount >= 0),
    Status ENUM('Pending','Completed','Cancelled')
	DEFAULT 'Pending',

    FOREIGN KEY (Customer_id)
        REFERENCES Customers(Customer_id),

    FOREIGN KEY (Employee_id)
        REFERENCES Employees(Employee_id)
);

CREATE TABLE Order_Details(
    Order_id INT,
    Book_id INT,
    Quantity INT NOT NULL CHECK(Quantity>0),
    Subtotal DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(Order_id,Book_id),
	FOREIGN KEY(Order_id)
        REFERENCES Orders(Order_id),
	FOREIGN KEY(Book_id)
        REFERENCES Books(Book_id)
);

CREATE TABLE Payments(
    Payment_id INT PRIMARY KEY AUTO_INCREMENT,
    Order_id INT NOT NULL,
    Payment_date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
    Payment_status ENUM('Pending', 'Paid', 'Failed', 'Refunded')
    DEFAULT 'Pending',
    Transaction_id VARCHAR(100) UNIQUE NOT NULL,

    FOREIGN KEY (Order_id)
        REFERENCES Orders(Order_id)
);

CREATE TABLE Inventory(
    Inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    Book_id INT NOT NULL,
    Supplier_id INT NOT NULL,
    Quantity_in_stock INT NOT NULL CHECK (Quantity_in_stock >= 0),
    Last_restock_date DATE,
    Cost_price DECIMAL(10,2) NOT NULL CHECK (Cost_price >= 0),

    FOREIGN KEY (Book_id)
        REFERENCES Books(Book_id),

    FOREIGN KEY (Supplier_id)
        REFERENCES Suppliers(Supplier_id)
);



