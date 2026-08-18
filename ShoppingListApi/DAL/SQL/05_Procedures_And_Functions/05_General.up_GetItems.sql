CREATE OR ALTER PROCEDURE [General].[up_GetItems]
AS

BEGIN
    SET NOCOUNT ON;

    SELECT
        [Id]
        ,[Name]
        ,[PurchasedBy]
        ,[IsPurchased]
    FROM
        [General].[Items];
END
GO
