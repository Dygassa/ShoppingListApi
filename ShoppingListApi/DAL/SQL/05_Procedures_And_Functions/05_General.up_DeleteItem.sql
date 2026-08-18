CREATE OR ALTER PROCEDURE [General].[up_DeleteItem]
    @Id INT
AS

BEGIN
    SET NOCOUNT ON;

    DELETE FROM
        [General].[Items]
    OUTPUT
        DELETED.[Id]
    WHERE
        [Id] = @Id
END
GO
