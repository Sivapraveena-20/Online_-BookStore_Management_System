-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: online_bookstore_db
-- ------------------------------------------------------
-- Server version	9.7.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '0436666f-71f8-11f1-a03d-842afd4cd3d0:1-111';

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `Book_id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) NOT NULL,
  `Author` varchar(150) NOT NULL,
  `Publisher_id` int NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Published_Year` year DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Book_id`),
  KEY `Publisher_id` (`Publisher_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`Publisher_id`) REFERENCES `publishers` (`Publisher_id`),
  CONSTRAINT `books_chk_1` CHECK ((`Price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Alchemist','Paulo Coelho',1,399.00,1988,'Fiction'),(2,'Atomic Habits','James Clear',2,699.00,2018,'Self Help'),(3,'Clean Code','Robert C. Martin',4,899.00,2008,'Programming'),(4,'Introduction to Algorithms','Thomas H. Cormen',5,1299.00,2009,'Computer Science'),(5,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',1,599.00,1997,'Fantasy'),(6,'Rich Dad Poor Dad','Robert Kiyosaki',2,499.00,1997,'Finance'),(7,'Data Structures Using C','Reema Thareja',4,750.00,2012,'Programming'),(8,'Python Crash Course','Eric Matthes',4,950.00,2019,'Programming');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_orders`
--

DROP TABLE IF EXISTS `customer_orders`;
/*!50001 DROP VIEW IF EXISTS `customer_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_orders` AS SELECT 
 1 AS `Customer_id`,
 1 AS `Customer_name`,
 1 AS `Order_id`,
 1 AS `Order_date`,
 1 AS `Total_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Customer_id` int NOT NULL AUTO_INCREMENT,
  `Customer_name` varchar(150) NOT NULL,
  `Customer_email` varchar(255) NOT NULL,
  `Customer_phone` varchar(15) DEFAULT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `Created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Customer_id`),
  UNIQUE KEY `Customer_email` (`Customer_email`),
  UNIQUE KEY `Customer_phone` (`Customer_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Shiv','shivvv@gmail.com','7988667701','Chennai','2026-06-28 09:05:23'),(2,'Priya','priya@gmail.com','9876500002','Chennai','2026-06-28 09:05:23'),(3,'Atchaya','atchaya@gmail.com','9876500003','Bengaluru','2026-06-28 09:05:23'),(4,'Suba','suba@gmail.com','9876500004','Ahmedabad','2026-06-28 09:05:23'),(5,'Rahul','rahul@gmail.com','9876500001','Mumbai','2026-06-28 09:05:23'),(6,'Shanmi','shanmi@gmail.com','9787098210','Chennai','2026-06-28 09:05:23'),(7,'Alvi','alvi@gmail.com','9876500005','Delhi','2026-06-28 09:05:23');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `Employee_id` int NOT NULL AUTO_INCREMENT,
  `Employee_name` varchar(255) NOT NULL,
  `Employee_email` varchar(255) NOT NULL,
  `Employee_phone` varchar(15) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `Hire_date` date NOT NULL,
  `Created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Employee_id`),
  UNIQUE KEY `Employee_email` (`Employee_email`),
  UNIQUE KEY `Employee_phone` (`Employee_phone`),
  CONSTRAINT `employees_chk_1` CHECK ((`Salary` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Sharma','sharma@bookstore.com','9876543210','Store Manager',65000.00,'2023-01-15','2026-06-28 09:31:14'),(2,'Preethu','preethu@bookstore.com','9876543211','Cashier',32000.00,'2023-03-20','2026-06-28 09:31:14'),(3,'Arjun Kumar','arjunkumar@bookstore.com','9876543212','Sales Executive',35000.00,'2023-05-10','2026-06-28 09:31:14'),(4,'Sneha','sneha@bookstore.com','9876543213','Inventory Manager',42000.00,'2023-07-18','2026-06-28 09:31:14'),(5,'Kiran','kiran@bookstore.com','9876543214','Sales Executive',36000.00,'2023-09-12','2026-06-28 09:31:14'),(6,'Sam','sam@bookstore.com','9876543215','Cashier',33000.00,'2024-01-08','2026-06-28 09:31:14'),(7,'Vikram','vikram@bookstore.com','9876543216','Store Assistant',28000.00,'2024-02-14','2026-06-28 09:31:14'),(8,'Anitha','anitha@bookstore.com','9876543217','Customer Support',30000.00,'2024-04-01','2026-06-28 09:31:14'),(9,'Joe','joe@bookstore.com','9876543218','Sales Executive',37000.00,'2024-06-05','2026-06-28 09:31:14'),(10,'Pooja','pooja@bookstore.com','9876543219','Customer Support',30000.00,'2024-08-20','2026-06-28 09:31:14');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `Inventory_id` int NOT NULL AUTO_INCREMENT,
  `Book_id` int NOT NULL,
  `Supplier_id` int NOT NULL,
  `Quantity_in_stock` int NOT NULL,
  `Last_restock_date` date DEFAULT NULL,
  `Cost_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Inventory_id`),
  KEY `Book_id` (`Book_id`),
  KEY `Supplier_id` (`Supplier_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `books` (`Book_id`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`Supplier_id`) REFERENCES `suppliers` (`Supplier_id`),
  CONSTRAINT `inventory_chk_1` CHECK ((`Quantity_in_stock` >= 0)),
  CONSTRAINT `inventory_chk_2` CHECK ((`Cost_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,1,40,'2026-06-10',250.00),(2,2,2,35,'2026-06-12',450.00),(3,3,3,20,'2026-06-14',650.00),(4,4,4,15,'2026-06-15',950.00),(5,5,1,50,'2026-06-16',380.00),(6,6,5,30,'2026-06-18',320.00),(7,7,2,18,'2026-06-19',500.00),(8,8,3,22,'2026-06-20',700.00);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `Order_id` int NOT NULL,
  `Book_id` int NOT NULL,
  `Quantity` int NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Order_id`,`Book_id`),
  KEY `Book_id` (`Book_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `orders` (`Order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`Book_id`) REFERENCES `books` (`Book_id`),
  CONSTRAINT `order_details_chk_1` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,2,1,699.00),(1,6,1,399.00),(2,4,1,1299.00),(3,1,1,400.00),(3,5,2,1198.00),(4,2,1,699.00),(5,8,1,950.00),(6,2,1,699.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order_id` int NOT NULL AUTO_INCREMENT,
  `Order_date` date NOT NULL,
  `Customer_id` int NOT NULL,
  `Employee_id` int NOT NULL,
  `Total_amount` decimal(10,2) NOT NULL,
  `Status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`Order_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Employee_id` (`Employee_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Employee_id`) REFERENCES `employees` (`Employee_id`),
  CONSTRAINT `orders_chk_1` CHECK ((`Total_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2026-06-20',1,2,1098.00,'Completed'),(2,'2026-06-21',2,3,1299.00,'Completed'),(3,'2026-06-22',3,5,1598.00,'Pending'),(4,'2026-06-23',4,2,699.00,'Completed'),(5,'2026-06-24',5,3,950.00,'Cancelled'),(6,'2026-06-25',6,1,950.00,'Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `Payment_id` int NOT NULL AUTO_INCREMENT,
  `Order_id` int NOT NULL,
  `Payment_date` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Payment_status` enum('Pending','Paid','Failed','Refunded') DEFAULT 'Pending',
  `Transaction_id` varchar(100) NOT NULL,
  PRIMARY KEY (`Payment_id`),
  UNIQUE KEY `Transaction_id` (`Transaction_id`),
  KEY `Order_id` (`Order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `orders` (`Order_id`),
  CONSTRAINT `payments_chk_1` CHECK ((`Amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2026-06-20',1098.00,'Paid','TXN100001'),(2,2,'2026-06-21',1299.00,'Paid','TXN100002'),(3,3,'2026-06-22',1598.00,'Pending','TXN100003'),(4,4,'2026-06-23',699.00,'Paid','TXN100004'),(5,5,'2026-06-24',950.00,'Refunded','TXN100005'),(6,6,'2026-06-25',699.00,'Pending','TXN100006');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `Publisher_id` int NOT NULL AUTO_INCREMENT,
  `Publisher_name` varchar(150) NOT NULL,
  `Publisher_email` varchar(255) NOT NULL,
  `Publisher_phone` varchar(15) NOT NULL,
  `Publisher_address` varchar(300) NOT NULL,
  `Created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Publisher_id`),
  UNIQUE KEY `Publisher_email` (`Publisher_email`),
  UNIQUE KEY `Publisher_phone` (`Publisher_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Penguin Random House','contact@penguin.com','9876543201','New York, USA','2026-06-28 08:59:47'),(2,'HarperCollins','support@harpercollins.com','9876543202','London, UK','2026-06-28 08:59:47'),(3,'Oxford University Press','info@oup.com','9876543203','Oxford, UK','2026-06-28 08:59:47'),(4,'Pearson Education','help@pearson.com','9876543204','London, UK','2026-06-28 08:59:47'),(5,'McGraw Hill','contact@mcgrawhill.com','9876543205','New York, USA','2026-06-28 08:59:47');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `Supplier_id` int NOT NULL AUTO_INCREMENT,
  `Supplier_name` varchar(150) NOT NULL,
  `Contact_person` varchar(150) NOT NULL,
  `Supplier_phone` varchar(15) NOT NULL,
  `Supplier_email` varchar(255) NOT NULL,
  `Supplier_address` varchar(300) NOT NULL,
  PRIMARY KEY (`Supplier_id`),
  UNIQUE KEY `Supplier_phone` (`Supplier_phone`),
  UNIQUE KEY `Supplier_email` (`Supplier_email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'ABC Book Distributors','Amit','9123456781','abc@suppliers.com','Mumbai'),(2,'National Book Supply','Rakesh','9123456782','national@suppliers.com','Delhi'),(3,'Global Book House','Priya','9123456783','global@suppliers.com','Chennai'),(4,'Knowledge Suppliers','Kumar','9123456784','knowledge@suppliers.com','Hyderabad'),(5,'EduBooks Pvt Ltd','Sneha','9123456785','edubooks@suppliers.com','Pune');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_orders`
--

/*!50001 DROP VIEW IF EXISTS `customer_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_orders` AS select `c`.`Customer_id` AS `Customer_id`,`c`.`Customer_name` AS `Customer_name`,`o`.`Order_id` AS `Order_id`,`o`.`Order_date` AS `Order_date`,`o`.`Total_amount` AS `Total_amount` from (`customers` `c` join `orders` `o` on((`c`.`Customer_id` = `o`.`Customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-28 22:53:19
