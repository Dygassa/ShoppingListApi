CREATE TABLE [General].[Items](
    [Id] INT IDENTITY(1, 1)
    ,[Name] NVARCHAR(255) NOT NULL
    ,[PurchasedBy] NVARCHAR(50)
    ,[IsPurchased] BIT NOT NULL DEFAULT 0
    ,CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED ([Id])
)
