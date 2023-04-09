SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;

CREATE TABLE dbo.SKU
 (
     ID INT IDENTITY PRIMARY KEY,
     Code AS 's' + CAST(ID AS VARCHAR(10)),
     Name VARCHAR(250),
     CONSTRAINT AK_Code UNIQUE (Code)
)

CREATE TABLE dbo.Family
 (
     ID INT IDENTITY PRIMARY KEY,
     SurName VARCHAR(250),
     BubgetValue money NOT NULL
)

CREATE TABLE dbo.Basket
 (
     ID INT IDENTITY PRIMARY KEY,
     ID_SKU INT NOT NULL,
     ID_Family INT NOT NULL,
     Quantity INT NOT NULL,
     Value MONEY NOT NULL,
     PurchaseDate DATETIME  CONSTRAINT DFT_Basket_PurchaseDate DEFAULT SYSDATETIME(),
     DiscountValue money NOT NULL,
     CONSTRAINT FK_Basket_SKU FOREIGN KEY(ID_SKU)
     REFERENCES dbo.SKU(ID),
     CONSTRAINT FK_Basket_Family FOREIGN KEY(ID_Family)
     REFERENCES dbo.Family(ID),
     CONSTRAINT CHK_Basket_Quantity
     CHECK(Quantity > 0),
     CONSTRAINT CHK_Basket_Value
     CHECK(Value > 0.00),

)