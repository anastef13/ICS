IF OBJECT_ID ('dbo.udf_GetSKUPrice') IS NOT NULL DROP FUNCTION dbo.udf_GetSKUPrice;
GO
CREATE FUNCTION dbo.udf_GetSKUPrice (@ID_SKU INT)
RETURNS DECIMAL(18, 2)
AS
    BEGIN
        DECLARE @PRICE DECIMAL(18, 2)
        SELECT @PRICE = SUM(Value) / SUM(Quantity)
        FROM DBO.Basket
        WHERE ID_SKU=@ID_SKU
        RETURN @PRICE
    END;
