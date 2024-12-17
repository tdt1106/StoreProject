USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_UpdateHeader]    Script Date: 17/12/2024 6:40:33 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Stored Procedure: SP_UpdateHeader
CREATE PROCEDURE [dbo].[SP_UpdateHeader]
    @RowPointer UNIQUEIDENTIFIER,
    @Column1 NVARCHAR(100),
    @Column2 NVARCHAR(100),
    @Column3 NVARCHAR(100),
    @Column4 NVARCHAR(100),
    @Column5 NVARCHAR(100),
    @Column6 NVARCHAR(100),
    @Column7 NVARCHAR(100),
    @Column8 NVARCHAR(100),
    @Column9 NVARCHAR(100),
    @Column10 NVARCHAR(100),
    @Column11 NVARCHAR(100),
    @Column12 NVARCHAR(100),
    @Column13 NVARCHAR(100),
    @UpdatedBy NVARCHAR(100)
AS
BEGIN
    UPDATE Header
    SET Column1 = @Column1, Column2 = @Column2, Column3 = @Column3, 
        Column4 = @Column4, Column5 = @Column5, Column6 = @Column6, 
        Column7 = @Column7, Column8 = @Column8, Column9 = @Column9, 
        Column10 = @Column10, Column11 = @Column11, Column12 = @Column12, 
        Column13 = @Column13, UpdatedBy = @UpdatedBy, UpdatedDate = GETDATE()
    WHERE RowPointer = @RowPointer;
END;
GO

