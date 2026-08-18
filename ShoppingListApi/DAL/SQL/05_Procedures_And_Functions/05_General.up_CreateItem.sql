CREATE OR ALTER PROCEDURE [General].[up_CreateItem]
    @Name NVARCHAR(255)
AS

BEGIN
    SET NOCOUNT ON;

    INSERT INTO [General].[Items](
        [Name])
    OUTPUT
        INSERTED.[Id]
    VALUES(
        @Name);
END
GO
