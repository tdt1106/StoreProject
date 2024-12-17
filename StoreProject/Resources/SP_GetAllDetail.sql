USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_GetAllDetail]    Script Date: 17/12/2024 6:39:07 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Stored Procedure: SP_GetAllDetail
CREATE PROCEDURE [dbo].[SP_GetAllDetail]
AS
BEGIN
    SELECT 
        RowPointer, ID, HeaderRowFunding, Column1, Column2, Column3, 
        CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
    FROM Detail;
END;
GO

