CREATE TABLE [System].[DbInfo] (
    [Key] VARCHAR(64) PRIMARY KEY
    ,[Value] VARCHAR(255) NOT NULL
    ,[Timestamp] DATETIME2 DEFAULT GETUTCDATE()
    ,[Notes] VARCHAR(255)
);
GO

INSERT INTO [System].[DbInfo]
    ([Key], [Value], [Timestamp], [Notes])
VALUES
    ('SCHEMA_VERSION', '1.0.0', GETUTCDATE(), 'Initial version');
GO

CREATE OR ALTER PROCEDURE [System].[up_GetVersionParts]
    @version VARCHAR(50)
    ,@major INT OUT
    ,@minor INT OUT
    ,@patch INT OUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @startPos INT = 1;
    DECLARE @endPos INT;

    SET @endPos = CHARINDEX('.', @version, @startPos)
    SET @major = CAST(SUBSTRING(@version, @startPos, @endPos - @startPos) AS INT)
    SET @startPos = @endPos + 1

    SET @endPos = CHARINDEX('.', @version, @startPos);
    SET @minor = CAST(SUBSTRING(@version, @startPos, @endPos - @startPos) AS INT);
    SET @startPos = @endPos + 1;

    SET @endPos = LEN(@version) + 1;
    SET @patch = CAST(SUBSTRING(@version, @startPos, @endPos - @startPos) AS INT);
END
GO

CREATE OR ALTER PROCEDURE [System].[up_CompareSchemaVersions]
    @version1 VARCHAR(50)
    ,@version2 VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @major1 INT;
    DECLARE @minor1 INT;
    DECLARE @patch1 INT;
    DECLARE @major2 INT;
    DECLARE @minor2 INT;
    DECLARE @patch2 INT;

    EXEC [System].[up_GetVersionParts] @version1, @major1 OUT, @minor1 OUT, @patch1 OUT;

    EXEC [System].[up_GetVersionParts] @version2, @major2 OUT, @minor2 OUT, @patch2 OUT;

    DECLARE @output INT = 0;

    IF @major1 < @major2
        SET @output = -1;
    ELSE IF @major1 > @major2
        SET @output = 1;
    ELSE IF @minor1 < @minor2
        SET @output = -1;
    ELSE IF @minor1 > @minor2
        SET @output = 1;
    ELSE IF @patch1 < @patch2
        SET @output = -1;
    ELSE IF @patch1 > @patch2
        SET @output = 1;

    RETURN @output;
END
GO
