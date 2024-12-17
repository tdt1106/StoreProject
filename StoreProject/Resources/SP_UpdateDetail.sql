USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_UpdateDetail]    Script Date: 17/12/2024 6:40:16 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Stored Procedure: SP_UpdateDetail
CREATE PROCEDURE [dbo].[SP_UpdateDetail]
    @RowPointer UNIQUEIDENTIFIER,
    @Column1 NVARCHAR(100),
    @Column2 NVARCHAR(100),
    @Column3 NVARCHAR(100),
    @UpdatedBy NVARCHAR(100)
AS
BEGIN
    UPDATE Detail
    SET Column1 = @Column1, Column2 = @Column2, Column3 = @Column3, 
        UpdatedBy = @UpdatedBy, UpdatedDate = GETDATE()
    WHERE RowPointer = @RowPointer;
END;
GO

