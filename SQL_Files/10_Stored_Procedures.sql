-- Add a new book to the Books table

DELIMITER $$
CREATE PROCEDURE AddBook(
    IN p_title          VARCHAR(200),
    IN p_author         VARCHAR(150),
    IN p_publisher_id   INT,
    IN p_price          DECIMAL(10,2),
    IN p_published_year YEAR,
    IN p_category       VARCHAR(100)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Publishers
        WHERE Publisher_id = p_publisher_id   
    ) THEN

        INSERT INTO Books
        (
            Title,
            Author,
            Publisher_id,        
            Price,
            Published_Year,     
            Category
        )
        VALUES
        (
            p_title,
            p_author,
            p_publisher_id,
            p_price,
            p_published_year,
            p_category
        );

        SELECT CONCAT('Book "', p_title, '" added successfully.') AS Message;

    ELSE

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Publisher_id: Publisher does not exist.';

    END IF;

END $$

DELIMITER ;


CALL AddBook('The Oxford Handbook of Data Science', 'Various Authors', 3, 1499.00, 2022, 'Computer Science');


SELECT * FROM Books WHERE Title = 'The Oxford Handbook of Data Science';
