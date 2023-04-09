CREATE VIEW dbo.vw_SKUPrice
AS
SELECT
ID_SKU, Code, Name, dbo.udf_GetSKUPrice(ID_SKU) AS Price
FROM dbo.SKU S
JOIN dbo.Basket B ON S.ID = B.ID_SKU;