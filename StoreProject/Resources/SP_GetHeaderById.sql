USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_GetHeaderById]    Script Date: 17/12/2024 6:39:46 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Stored Procedure: SP_GetHeaderById
CREATE PROCEDURE [dbo].[SP_GetHeaderById]
    @ID INT
AS
BEGIN
    SELECT 
        RowPointer, ID, Column1, Column2, Column3, Column4, Column5, 
        Column6, Column7, Column8, Column9, Column10, Column11, 
        Column12, Column13, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
    FROM Header
    WHERE ID = @ID;
END;
GO
