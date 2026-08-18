IF DB_ID(N'ShoppingList') IS NULL
BEGIN
    CREATE DATABASE [ShoppingList]
        COLLATE Polish_100_CI_AS;
END;
GO

USE [ShoppingList];
GO
