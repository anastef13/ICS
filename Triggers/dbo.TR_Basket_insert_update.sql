CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
FOR INSERT
AS
BEGIN
    DECLARE @ID_SKU INT;
    SELECT @ID_SKU = ID_SKU
    FROM inserted;
    IF (SELECT COUNT(*) FROM inserted WHERE ID_SKU = @ID_SKU) >= 2
        UPDATE dbo.Basket
        SET DiscountValue = Value * 0.05
        WHERE ID_SKU = @ID_SKU;
    ELSE
        UPDATE dbo.Basket
        SET DiscountValue = 0
        WHERE ID_SKU = @ID_SKU;
    END