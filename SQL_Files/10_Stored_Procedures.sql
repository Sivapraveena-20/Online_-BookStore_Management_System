-- ==============================================
-- 10_Stored_Procedures.sql | Online Bookstore System
-- ==============================================

-- Add a new book to the Books table
-- FIX: Column names corrected to match 02_create_tables.sql
--      (Publisher_id, Published_Year → case-sensitive match)
--      EXISTS check uses correct column name Publisher_id

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

    -- Check if the Publisher_id exists in Publishers table
    IF EXISTS (
        SELECT 1
        FROM Publishers
        WHERE Publisher_id = p_publisher_id   -- ✅ Fixed: was 'PublisherID' (wrong column name)
    ) THEN

        INSERT INTO Books
        (
            Title,
            Author,
            Publisher_id,        -- ✅ Fixed: was 'PublisherID'
            Price,
            Published_Year,      -- ✅ Fixed: was 'PublishedYear'
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

        -- Success message
        SELECT CONCAT('Book "', p_title, '" added successfully.') AS Message;

    ELSE

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Publisher_id: Publisher does not exist.';

    END IF;

END $$

DELIMITER ;


-- Test the procedure
-- Publisher_id = 3 exists (Oxford University Press)
CALL AddBook('The Oxford Handbook of Data Science', 'Various Authors', 3, 1499.00, 2022, 'Computer Science');

-- Verify the book was added
SELECT * FROM Books WHERE Title = 'The Oxford Handbook of Data Science';
