USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_CreateHeader]    Script Date: 17/12/2024 6:38:39 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Stored Procedure: SP_CreateHeader
CREATE PROCEDURE [dbo].[SP_CreateHeader]
    @ID INT,
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
    @CreatedBy NVARCHAR(100)
AS
BEGIN
    INSERT INTO Header (
        RowPointer, ID, Column1, Column2, Column3, Column4, Column5, 
        Column6, Column7, Column8, Column9, Column10, Column11, 
        Column12, Column13, CreatedBy, CreatedDate
    )
    VALUES (
        NEWID(), @ID, @Column1, @Column2, @Column3, @Column4, @Column5, 
        @Column6, @Column7, @Column8, @Column9, @Column10, @Column11, 
        @Column12, @Column13, @CreatedBy, GETDATE()
    );
END;
GO

