USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_GetDetailById]    Script Date: 17/12/2024 6:39:32 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Stored Procedure: SP_GetDetailById
CREATE PROCEDURE [dbo].[SP_GetDetailById]
    @ID INT
AS
BEGIN
    SELECT 
        RowPointer, ID, HeaderRowFunding, Column1, Column2, Column3, 
        CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
    FROM Detail
    WHERE ID = @ID;
END;
GO

