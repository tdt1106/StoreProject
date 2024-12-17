USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_DeleteDetail]    Script Date: 17/12/2024 6:38:47 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Stored Procedure: SP_DeleteDetail
CREATE PROCEDURE [dbo].[SP_DeleteDetail]
    @RowPointer UNIQUEIDENTIFIER
AS
BEGIN
    DELETE FROM Detail
    WHERE RowPointer = @RowPointer;
END;
GO

