
CREATE TRIGGER trg_ReorderCheck
ON Products
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT * FROM inserted
        WHERE QuantityInStock < ReorderLevel
    )
    BEGIN
        PRINT 'Reorder Alert: Product stock is below reorder level.';
    END
END;


-- checking that the trigger is in action

UPDATE Products SET QuantityInStock = 5 WHERE ProductID = 1;
