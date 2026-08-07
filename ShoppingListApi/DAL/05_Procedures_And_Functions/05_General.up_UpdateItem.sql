CREATE OR ALTER PROCEDURE [General].[up_UpdateItem]
    @Id INT
    ,@Name NVARCHAR(255)
    ,@PurchasedBy NVARCHAR(50)
    ,@IsPurchased BIT
AS

BEGIN
    SET NOCOUNT ON;

    UPDATE
        [General].[Items]
    SET
        [Name] = @Name
        ,[PurchasedBy] = @PurchasedBy
        ,[IsPurchased] = @IsPurchased
    OUTPUT
        INSERTED.[Id]
    WHERE
        [Id] = @Id
END
GO
