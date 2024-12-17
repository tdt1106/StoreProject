USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_UpsertHeader]    Script Date: 17/12/2024 9:20:36 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpsertHeader]
    @RowPointer UNIQUEIDENTIFIER,
    @ID INT,
    @Column1 NVARCHAR(255),
    @Column2 NVARCHAR(255),
    @Column3 NVARCHAR(255),
    @Column4 NVARCHAR(255),
    @Column5 NVARCHAR(255),
    @Column6 NVARCHAR(255),
    @Column7 NVARCHAR(255),
    @Column8 NVARCHAR(255),
    @Column9 NVARCHAR(255),
    @Column10 NVARCHAR(255),
    @Column11 NVARCHAR(255),
    @Column12 NVARCHAR(255),
    @Column13 NVARCHAR(255),
    @CreatedBy NVARCHAR(100),
    @UpdatedBy NVARCHAR(100)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Header WHERE RowPointer = @RowPointer)
    BEGIN
        UPDATE Header
        SET ID = @ID,
            Column1 = @Column1,
            Column2 = @Column2,
            Column3 = @Column3,
            Column4 = @Column4,
            Column5 = @Column5,
            Column6 = @Column6,
            Column7 = @Column7,
            Column8 = @Column8,
            Column9 = @Column9,
            Column10 = @Column10,
            Column11 = @Column11,
            Column12 = @Column12,
            Column13 = @Column13,
            UpdatedBy = @UpdatedBy,
            UpdatedDate = GETDATE()
        WHERE RowPointer = @RowPointer;
    END
    ELSE
    BEGIN
        INSERT INTO Header (RowPointer, ID, Column1, Column2, Column3, Column4, Column5, Column6, Column7, Column8, Column9, Column10, Column11, Column12, Column13, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate)
        VALUES (@RowPointer, @ID, @Column1, @Column2, @Column3, @Column4, @Column5, @Column6, @Column7, @Column8, @Column9, @Column10, @Column11, @Column12, @Column13, @CreatedBy, GETDATE(), @UpdatedBy, GETDATE());
    END
END;
GO

