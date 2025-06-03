-- Simple Report View
CREATE VIEW vw_StockReport AS
SELECT ProductName, QuantityInStock, ReorderLevel
FROM Products;

