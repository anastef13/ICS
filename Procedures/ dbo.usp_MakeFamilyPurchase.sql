CREATE PROC dbo.usp_MakeFamilyPurchase @FamilySurName varchar(255)
AS
    BEGIN
        IF NOT EXISTS(SELECT *
                      FROM dbo.Family
                      WHERE dbo.Family.SurName=@FamilySurName)
            BEGIN RAISERROR ('Такой семьи нет', 16, 1)
            END
 UPDATE dbo.Family
        SET BubgetValue=dbo.Family.BubgetValue-(SELECT SUM(dbo.Basket.Value)
            FROM dbo.Basket
            WHERE SurName=@FamilySurName)
        WHERE SurName=@FamilySurName;
    END