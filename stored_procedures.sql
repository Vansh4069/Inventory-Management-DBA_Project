-- Stored Procedure to Add New Orders
CREATE PROCEDURE AddPurchaseOrder
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    INSERT INTO PurchaseOrders (ProductID, QuantityOrdered)
    VALUES (@ProductID, @Quantity);

    UPDATE Products
    SET QuantityInStock = QuantityInStock + @Quantity
    WHERE ProductID = @ProductID;
END;

EXEC AddPurchaseOrder @ProductID = 1, @Quantity = 20;
