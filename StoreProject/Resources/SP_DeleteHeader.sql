USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_DeleteHeader]    Script Date: 17/12/2024 6:38:56 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Stored Procedure: SP_DeleteHeader
CREATE PROCEDURE [dbo].[SP_DeleteHeader]
    @RowPointer UNIQUEIDENTIFIER
AS
BEGIN
    DELETE FROM Header
    WHERE RowPointer = @RowPointer;
END;
 
GO

