-- Group by:
SELECT Category, SUM(Price) FROM Books GROUP BY Category;

-- Having:
SELECT Category , MAX(Price) FROM Books GROUP BY Category HAVING MAX(Price) > 500;