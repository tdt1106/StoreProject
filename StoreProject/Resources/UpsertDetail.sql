USE [StoreDb]
GO

/****** Object:  StoredProcedure [dbo].[SP_UpsertDetail]    Script Date: 17/12/2024 9:20:29 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpsertDetail]
    @RowPointer UNIQUEIDENTIFIER,
    @ID INT,
    @HeaderRowFunding UNIQUEIDENTIFIER,
    @Column1 NVARCHAR(255),
    @Column2 NVARCHAR(255),
    @Column3 NVARCHAR(255),
    @CreatedBy NVARCHAR(100),
    @UpdatedBy NVARCHAR(100)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Detail WHERE RowPointer = @RowPointer)
    BEGIN
        UPDATE Detail
        SET ID = @ID,
            HeaderRowFunding = @HeaderRowFunding,
            Column1 = @Column1,
            Column2 = @Column2,
            Column3 = @Column3,
            UpdatedBy = @UpdatedBy,
            UpdatedDate = GETDATE()
        WHERE RowPointer = @RowPointer;
    END
    ELSE
    BEGIN
        INSERT INTO Detail (RowPointer, ID, HeaderRowFunding, Column1, Column2, Column3, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate)
        VALUES (@RowPointer, @ID, @HeaderRowFunding, @Column1, @Column2, @Column3, @CreatedBy, GETDATE(), @UpdatedBy, GETDATE());
    END
END;
GO

