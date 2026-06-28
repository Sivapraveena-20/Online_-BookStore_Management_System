DELIMITER $$
CREATE FUNCTION CalculateTotal(
p_price DECIMAL(10,2),
p_quantity INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	RETURN p_price * p_quantity;
END $$
DELIMITER ;

SELECT CalculateTotal(699,3);